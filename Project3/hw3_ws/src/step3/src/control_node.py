#!/usr/bin/python3

import rospy
from geometry_msgs.msg import Twist
from sensor_msgs.msg import LaserScan
import matplotlib.pyplot as plt

class PIDController():


    def __init__(self):
        
        rospy.init_node('controller', anonymous=False)
        self.cmd_vel = rospy.Publisher('/cmd_vel', Twist, queue_size=10)
        rospy.on_shutdown(self.on_shutdown)

        # if we want to follow wall on right hand the robot should rotate 
        # in the inverse direction of default state. so we multiply -1 coefficient
        # to (P+I+D)
        self.follow_type = rospy.get_param("/controller/follow_type")
        if self.follow_type == "right":
            self.direction = -1
        else:
            self.direction = 1
        
        # angular velocity PID gains
        self.k_p = 0.8
        self.k_i = 0.0005
        self.k_d = 25
        
        self.dt = 0.005
        self.v = 0.1
        self.D = 1.5

        rate = 1/self.dt
        self.r = rospy.Rate(rate)
        
        self.errs = []


    def distance_from_wall(self):
        '''
        this method give us the distance from wall with the help of scans
        comming from the lidar sensor. if direction is -1 means that we 
        want to have on the right hand of robot and ranges [180:] is important to
        be checked and if direction is 1 it is vice versa.
        '''
        laser_data = rospy.wait_for_message("/scan" , LaserScan)
        if self.direction==1:
            rng = laser_data.ranges[:180]
        else:
            rng = laser_data.ranges[180:]
        d = min(rng)
        return d

    
    def control(self):
        '''
        this function is the main function of this code. we calculate the 
        distance error and try to calculate P, I, D terms. the summation of these
        terms define our angular velocity.
        '''
        d = self.distance_from_wall()    
        sum_i_theta = 0
        prev_theta_error = 0
        
        move_cmd = Twist()
        move_cmd.angular.z = 0
        move_cmd.linear.x = self.v


        while not rospy.is_shutdown():
            self.cmd_vel.publish(move_cmd)
            rospy.loginfo(f"d : {d}")
            err = d - self.D
            self.errs.append(err)
            sum_i_theta += err * self.dt
            
            P = self.k_p * err
            I = self.k_i * sum_i_theta
            D = self.k_d * (err - prev_theta_error)

            move_cmd.angular.z = self.direction * (P + I + D)
            prev_theta_error = err
            move_cmd.linear.x = self.v            
            
            #rospy.loginfo(f"P : {P} I : {I} D : {D}")
            #rospy.loginfo(f"error : {err} speed : {move_cmd.linear.x} theta : {move_cmd.angular.z}")
            
            d = self.distance_from_wall()

            self.r.sleep()

    def on_shutdown(self):
        '''
        this method plot error of linear and angular velocity separately.
        '''
        rospy.loginfo("Stopping the robot...")
        self.cmd_vel.publish(Twist())
        plt.plot(list(range(len(self.errs))),self.errs, label='errs')
        plt.axhline(y=0,color='R')
        plt.draw()
        plt.legend(loc="upper left", frameon=False)
        plt.savefig(f"errs_{self.k_p}_{self.k_d}_{self.k_i}.png")
        plt.show()

        rospy.sleep(1)
            

if __name__ == '__main__':
    try:
        pidc = PIDController()
        pidc.control()
    except rospy.ROSInterruptException:
        rospy.loginfo("Navigation terminated.")