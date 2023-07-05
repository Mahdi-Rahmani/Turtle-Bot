#!/usr/bin/python3

import rospy
from geometry_msgs.msg import Twist
from sensor_msgs.msg import LaserScan
import matplotlib.pyplot as plt
import math
from nav_msgs.msg import Odometry
import tf
from step1.srv import GetVFHData, GetVFHDataRequest

class PIDController():


    def __init__(self):
        
        rospy.init_node('controller', anonymous=False)
        rospy.wait_for_service('vfh_data') # wait for response from service 
        self.calc_client = rospy.ServiceProxy('vfh_data', GetVFHData)

        self.k_i = 0.0
        self.k_p = 0.7
        self.k_d = 0.9
        
        self.dt = 0.005
        self.D = 0
        rate = 1/self.dt
        
        self.goals = [(4.5, -0.2), (3.4, 4.46), (2.3, 1.5), (0.5, 1.7), (1.0, 5.43), 
                                 (1.95, 5.55), (3.9, 7), (5, 5.5), (5.9,5.3), (5.6, 3), 
                                 (7.6, 3.1),(7.3, 5), (7.6, 6.7), (13, 6.65)]
        self.thresholds = [3, 2.5, 3, 3, 2.5, 3, 3.7, 3.5,3.6, 3.4, 4, 3.5, 3, 3]
        self.goal_counter = 0
        self.epsilon = 0.3
        # speed parameters
        self.V_max = 0.3                     # (m/s)
        self.V_min = 0.05                    # (m/s)
        self.omega_max = math.radians(120)   # (rad/s)
        self.h_m = 10

        self.r = rospy.Rate(rate)
        self.cmd_vel = rospy.Publisher('/cmd_vel', Twist, queue_size=5)
        self.errs = []

    def get_robot_pose(self):
        '''
        get x and y coordinate of position of the robot
        get the yaw angle of robot in world. 
        We call it, heading of the robot.
        '''
        # waiting for the most recent message from topic /odom
        msg = rospy.wait_for_message("/odom" , Odometry)
        
        orientation = msg.pose.pose.orientation
        position = msg.pose.pose.position

        # convert quaternion to odom
        roll, pitch, yaw = tf.transformations.euler_from_quaternion((
            orientation.x ,orientation.y ,orientation.z ,orientation.w
        )) 
        
        return position.x, position.y, yaw
    
    def update_goal_counter(self):
        cur_x, cur_y, yaw = self.get_robot_pose()
        dist = math.sqrt((cur_x-self.goals[self.goal_counter][0])**2 + (cur_y-self.goals[self.goal_counter][1])**2)
        if dist < self.epsilon:
            self.goal_counter += 1
        req = GetVFHDataRequest()
        req.goal_x, req.goal_y = self.goals[self.goal_counter]
        req.threshold = self.thresholds[self.goal_counter]
        resp = self.calc_client(req)
        return resp
    
    def refine_angle(self, angle):
        final_angle = 0
        if 0<=angle<130:
            final_angle = angle
        elif 230<=angle<360:
            final_angle = angle-360
        else:
            final_angle = 0
        return math.radians(final_angle)
    
    def control_velocity(self):

        resp = self.update_goal_counter()

        d = self.refine_angle(resp.desired_angle)
        sum_i_theta = 0
        prev_theta_error = 0
        
        move_cmd = Twist()
        move_cmd.angular.z = 0
        move_cmd.linear.x = self.V_max

        
        while not rospy.is_shutdown():

            self.cmd_vel.publish(move_cmd)
            resp = self.update_goal_counter()
            d = self.refine_angle(resp.desired_angle)
            #rospy.loginfo(f"desired_angle : {[resp.desired_angle]} ")
            err = d - self.D
            sum_i_theta += err * self.dt
                
            P = self.k_p * err
            I = self.k_i * sum_i_theta
            D = self.k_d * (err - prev_theta_error)

            omega = P + I + D 
            prev_theta_error = err
            #rospy.loginfo(f"omega : {[omega]} ") 

            #self.h_m = self.thresholds[self.goal_counter]+2           
            h_prim_prim_c = min(self.h_m, resp.h_prim_c)
            V_prim = self.V_max*(1-(h_prim_prim_c/self.h_m))
            V = V_prim*(1-(omega/self.omega_max))+self.V_min

            move_cmd.angular.z = omega
            move_cmd.linear.x = V

            self.r.sleep()


if __name__ == '__main__':
    try:
        pidc = PIDController()
        pidc.control_velocity()
    except rospy.ROSInterruptException:
        rospy.loginfo("contoller terminated.")