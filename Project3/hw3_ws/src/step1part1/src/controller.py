#!/usr/bin/python3

import rospy
import tf
from geometry_msgs.msg import Twist
import matplotlib.pyplot as plt
from nav_msgs.msg import Odometry
from math import atan2, sqrt, radians

class PIDController():

    def __init__(self):
        # initialize node and define it as a publisher
        rospy.init_node('controller', anonymous=False)
        rospy.on_shutdown(self.on_shutdown)
        self.cmd_publisher = rospy.Publisher('/cmd_vel' , Twist , queue_size=10)
        
        # (linear Velocity)

        # P controller
        # self.k_p_l = 0.08
        # self.k_i_l = 0.0
        # self.k_d_l= 0.0

        # PD controller
        #self.k_p_l = 0.1
        #self.k_i_l = 0.0
        #self.k_d_l = 0.2

        # PID controller
        self.k_p_l = 0.1
        self.k_i_l = 0.0005
        self.k_d_l = 0.2
        
        # (angular Velocity)

        # P controller
        # self.k_p_a = 0.3
        # self.k_i_a = 0.0
        # self.k_d_a = 0.0

        # PD controller
        #self.k_p_a = 0.3
        #self.k_i_a = 0.0
        #self.k_d_a = 0.9

        # PID controller
        self.k_p_a = 0.3
        self.k_i_a = 0.121
        self.k_d_a = 0.9

        # goal pose
        self.x_goal = 10
        self.y_goal = 0

        self.D = 0
        self.threshold = 0.005
        
        self.dist_errs = []
        self.angle_errs = []

        self.dt = 0.005
        rate = 1/self.dt
        self.r = rospy.Rate(rate)

    def get_pose(self):
        '''
        get x and y coordinate of position of the robot
        '''
        # waiting for the most recent message from topic /odom
        msg = rospy.wait_for_message("/odom" , Odometry)

        position = msg.pose.pose.position

        return position.x, position.y
    
    def get_heading(self):
        '''
        get the yaw angle of robot in world. 
        We call it, heading of the robot.
        '''
        # waiting for the most recent message from topic /odom
        msg = rospy.wait_for_message("/odom" , Odometry)
        
        orientation = msg.pose.pose.orientation

        # convert quaternion to odom
        roll, pitch, yaw = tf.transformations.euler_from_quaternion((
            orientation.x ,orientation.y ,orientation.z ,orientation.w
        )) 
        
        return yaw

    def distance_from_goal(self):
        '''
        this function get us the current Euclidean distance from goal
        '''
        x_curr, y_curr = self.get_pose()
        distance = sqrt((self.x_goal-x_curr)**2 + (self.y_goal-y_curr)**2)

        return distance
    
    def angle_from_goal(self):
        '''
        function below first calculate the heading angle and then the desired angle from current pose to goal pose.
        it means that robot heading must be equal to this angle for being in a 
        correct direction. then return the difference between heading and desired angle.
        '''

        # find x and y of current position and find relative x and y to goal point
        x_curr, y_curr = self.get_pose()
        relative_x = self.x_goal - x_curr
        relative_y = self.y_goal - y_curr
        # get heading of robot in radian
        heading = self.get_heading()
        # now we should find the desired angle
        # desired angle tell us the angle of goal point relative to current point
        desired_angle = 0
        if (relative_x == 0 and relative_y ==0):
            # this state (x=0 , y =0) is undefined so we handle it separately
            desired_angle = heading
        else:
            desired_angle = atan2(relative_y, relative_x)
        # the angle express howmuch we should rotate to reach the desired angle
        angle = heading - desired_angle
        # but we design controller and if the angle is bigger than 180 or less than -180
        # the robot must rotate alot so we should find its complementary to 360 degrees
        if angle < radians(-180):
            angle = radians(360)-abs(angle)
        elif angle > radians(180):
            angle = angle-radians(360)

        return angle
    
    def control(self):
        '''
        this function is the main function of this code. we calculate the angular and 
        linear distance error and try to calculate P, I, D terms. the summation of these
        terms define our linear and angular velocity.
        also we define a threshold and if the robot close to goal point and the goal and
        angle distance are less than that threshold the programe is terminated.
        '''
        distance = self.distance_from_goal()    
        sum_i_dist = 0
        prev_error_dist = 0

        angle = self.angle_from_goal()
        sum_i_angle = 0
        prev_error_angle = 0
        
        move_cmd = Twist()

        while not rospy.is_shutdown():

            # linear velocity
            err_dist = distance - self.D
            self.dist_errs.append(err_dist)
            sum_i_dist += err_dist * self.dt
            
            P_l = self.k_p_l * err_dist
            I_l = self.k_i_l * sum_i_dist
            D_l = self.k_d_l * (err_dist - prev_error_dist)

            move_cmd.linear.x = P_l + I_l + D_l 
            prev_error_dist = err_dist
            distance = self.distance_from_goal() 

            rospy.loginfo(f"linear velocity")
            rospy.loginfo(f"P_l : {P_l} I_l : {I_l} D_l : {D_l}")

            # angular velocity
            err_angle = angle - self.D
            self.angle_errs.append(err_angle)
            sum_i_angle += err_angle * self.dt
            
            P_a = self.k_p_a * err_angle
            I_a = self.k_i_a * sum_i_angle
            D_a = self.k_d_a * (err_angle - prev_error_angle)

            move_cmd.angular.z = -(P_a + I_a + D_a)
            self.cmd_publisher.publish(move_cmd)
            prev_error_angle = err_angle
            angle = self.angle_from_goal() 

            rospy.loginfo(f"angular velocity")
            rospy.loginfo(f"P_a : {P_a} I_a : {I_a} D_a : {D_a}")

            rospy.loginfo(f"error_angle : {err_angle} error_dist: {err_dist} angular speed : {move_cmd.angular.z} linear speed : {move_cmd.linear.x}")
            
            if err_dist < self.threshold and err_angle < self.threshold:
                break

            self.r.sleep()

    def on_shutdown(self):
        '''
        this method plot error of linear and angular velocity separately.
        '''
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