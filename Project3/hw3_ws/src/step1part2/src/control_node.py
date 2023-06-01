#!/usr/bin/python3

import rospy
import tf
import math
from nav_msgs.msg import Odometry
from geometry_msgs.msg import Twist
import matplotlib.pyplot as plt
from step1part2.srv import GetNextDestination, GetNextDestinationRequest

class PIDController():
    def __init__(self) -> None:

        rospy.init_node("controller" , anonymous=False)  # initialize node
        rospy.wait_for_service('get_destination')        # wait for response from service
        self.calc_client = rospy.ServiceProxy('get_destination', GetNextDestination)
        self.cmd_publisher = rospy.Publisher('/cmd_vel' , Twist , queue_size=10)  # this node also is a publisher

        self.current_x = 0
        self.current_y = 0

        # linear velocity PID gains
        self.k_p_l = 0.05
        self.k_i_l = 0
        self.k_d_l = 0

        # angular velocity PID gains
        self.k_p_a = 0.1
        self.k_i_a = 0
        self.k_d_a = 0

        # threshold for getting next point
        self.threshold = 0.009

        # define goal variables
        self.x_goal = 0
        self.y_goal = 0

        # arrays contains all errors in simulation time used for plotting
        self.dist_errs = []
        self.angle_errs = []

        # settings for rotation
        self.epsilon = 0.02
        self.angular_velocity = 0.04

        # time step of get feedback
        self.dt = 0.005
        # the desired value
        self.D = 0

        rate = 1/self.dt
        self.r = rospy.Rate(rate)

    # heading of the robot 
    def get_heading(self):
        # waiting for the most recent message from topic /odom
        msg = rospy.wait_for_message("/odom" , Odometry)
        
        orientation = msg.pose.pose.orientation

        # convert quaternion to odom
        roll, pitch, yaw = tf.transformations.euler_from_quaternion((
            orientation.x ,orientation.y ,orientation.z ,orientation.w
        )) 
        
        return yaw
    
    # position of the robot
    def get_pose(self):
        # waiting for the most recent message from topic /odom
        msg = rospy.wait_for_message("/odom" , Odometry)

        position = msg.pose.pose.position

        return position.x, position.y

    # function below get us the current Euclidean distance from goal
    def distance_from_goal(self):
        x_curr, y_curr = self.get_pose()
        distance = math.sqrt((self.x_goal-x_curr)**2 + (self.y_goal-y_curr)**2)

        return distance
    
    # function below first calculate the desired angle from current pose to goal pose
    # it means that robot heading must be equal to this angle for being in a 
    # correct direction. then return the difference between heading and desired angle.
    def angle_from_goal(self):
        x_curr, y_curr = self.get_pose()
        relative_x = self.x_goal - x_curr
        relative_y = self.y_goal - y_curr
        desired_angle = 0
        if (relative_x == 0 and relative_y ==0 ):
            desired_angle = 0
        else:
            desired_angle = math.atan2(relative_y, relative_x)

        heading = self.get_heading()

        angle = heading - desired_angle
        return angle
    
    # if the distance from current goal is less than threshold this function is called
    # this function get next goal from service
    def get_next_goal(self):
        self.current_x, self.current_y = self.get_pose()
        req = GetNextDestinationRequest()
        req.current_x = self.current_x
        req.current_y = self.current_y
        rospy.loginfo(f"Client : current pose: {req.current_x, req.current_y}")
        resp = self.calc_client(req)
        self.x_goal, self.y_goal = resp.next_x, resp.next_y
        rospy.loginfo(f"Client : Goal pose : {resp.next_x, resp.next_y}")
    
    # after finding the new goal first we should rotate until heading 
    # of robot is placed in a correct direction approximately
    def rotate(self):
        self.cmd_publisher.publish(Twist())
        twist = Twist()
        twist.angular.z = self.angular_velocity
        if (self.angle_from_goal()>0):
            twist.angular.z = -self.angular_velocity
        while abs(self.angle_from_goal()) >= self.epsilon:
            self.cmd_publisher.publish(twist)
        self.cmd_publisher.publish(Twist())

    def control(self):

        distance = self.distance_from_goal()    
        sum_i_dist = 0
        prev_error_dist = 0
        err_dist = distance - self.D

        angle = self.angle_from_goal()
        sum_i_angle = 0
        prev_error_angle = 0
        err_angle = angle - self.D
        
        move_cmd = Twist()

        counter = 0

        while not rospy.is_shutdown():
            # In this task we should go to a new goal for 4 times
            if counter == 4:
                break
            
            # If distance from current goal is less than threshold then define new goal
            if err_dist < self.threshold and err_angle < self.threshold:
                counter += 1
                rospy.loginfo(f"error dist: {err_dist } err_angle : {err_angle}")
                self.get_next_goal()
                #self.rotate()
            
            # linear velocity
            distance = self.distance_from_goal() 
            err_dist = distance - self.D
            self.dist_errs.append(err_dist)
            sum_i_dist += err_dist * self.dt
            
            P_l = self.k_p_l * err_dist
            I_l = self.k_i_l * sum_i_dist
            D_l = self.k_d_l * (err_dist - prev_error_dist)

            move_cmd.linear.x = P_l + I_l + D_l 
            prev_error_dist = err_dist

            #rospy.loginfo(f"linear velocity")
            #rospy.loginfo(f"P_l : {P_l} I_l : {I_l} D_l : {D_l}")

            # angular velocity
            angle = self.angle_from_goal() 
            err_angle = angle - self.D
            self.angle_errs.append(err_angle)
            sum_i_angle += err_angle * self.dt
            
            P_a = self.k_p_a * err_angle
            I_a = self.k_i_a * sum_i_angle
            D_a = self.k_d_a * (err_angle - prev_error_angle)

            move_cmd.angular.z = -(P_a + I_a + D_a)
            self.cmd_publisher.publish(move_cmd)
            prev_error_angle = err_angle

            #rospy.loginfo(f"angular velocity")
            rospy.loginfo(f"P_a : {P_a} I_a : {I_a} D_a : {D_a}")

            rospy.loginfo(f"error_angle : {err_angle} error_dist: {err_dist} angular speed : {move_cmd.angular.z} linear speed : {move_cmd.linear.x}")
            
        
            self.r.sleep()

    def on_shutdown(self):
        rospy.loginfo("Stopping the robot...")
        self.cmd_publisher.publish(Twist())
        # linear
        plt.plot(list(range(len(self.dist_errs))), self.dist_errs, label='dist_errs')
        plt.axhline(y=0,color='R')
        plt.draw()
        plt.legend(loc="upper left", frameon=False)
        plt.savefig(f"errs_dist_{self.k_p_l}_{self.k_d_l}_{self.k_i_l}.png")
        plt.show()
        
        # angular
        plt.plot(list(range(len(self.angle_errs))), self.angle_errs, label='angle_errs')
        plt.axhline(y=0,color='R')
        plt.draw()
        plt.legend(loc="upper left", frameon=False)
        plt.savefig(f"errs_angle_{self.k_p_a}_{self.k_d_a}_{self.k_i_a}.png")
        plt.show()
        rospy.sleep(1)

if __name__ == '__main__':
    try:
        pidc = PIDController()
        pidc.control()
    except rospy.ROSInterruptException:
        rospy.loginfo("Navigation terminated.")
    