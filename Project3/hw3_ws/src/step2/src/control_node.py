#!/usr/bin/python3

import rospy
import tf
import math
from nav_msgs.msg import Odometry
from geometry_msgs.msg import Twist
import matplotlib.pyplot as plt
import numpy as np

class PIDController():

    def __init__(self) -> None:

        rospy.init_node("controller" , anonymous=False)                           # initialize node
        self.cmd_publisher = rospy.Publisher('/cmd_vel' , Twist , queue_size=10)  # this node also is a publisher
        rospy.on_shutdown(self.on_shutdown)

        # linear velocity PID gains
        self.k_p_l = 0.1
        self.k_i_l = 0.001
        self.k_d_l = 0.02
        # angular velocity PID gains
        self.k_p_a = 0.3
        self.k_i_a = 0.003
        self.k_d_a = 0.1
        

        # its not necessary to check all points if we have 
        # alot of sample on path.
        self.index_increment = 2

        # the points list on a desired shape
        self.shape = rospy.get_param("/controller/shape")
        if self.shape == "rectangle":
            self.points = self.make_rectangle()
        elif self.shape == "star":
            self.points = self.make_star()
        elif self.shape == "logarithmic_spiral":
            self.points = self.make_logarithmic_spiral()
            self.index_increment = 1
        else:
            rospy.loginfo(f"please enter a valid shape")

        # threshold for getting next point
        self.dist_threshold = 0.25
        self.angle_threshold = 1.2

        # define goal variables
        self.x_goal = 0
        self.y_goal = 0

        # arrays contains all errors in simulation time used for plotting
        self.dist_errs = []
        self.angle_errs = []

        self.index = 0

        # time step of get feedback
        self.dt = 0.005
        # the desired value
        self.D = 0

        rate = 1/self.dt
        self.r = rospy.Rate(rate)

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
    
    def get_pose(self):
        '''
        get x and y coordinate of position of the robot
        '''
        # waiting for the most recent message from topic /odom
        msg = rospy.wait_for_message("/odom" , Odometry)

        position = msg.pose.pose.position

        return position.x, position.y

    def get_distance(self, point_target, point_curr):
        '''
        this function calculate Euclidean distance between 
        a given current and target point.
        '''
        x1, y1 = point_curr
        x2, y2 = point_target

        return math.sqrt((x2 - x1)**2 + (y2 - y1)**2)

    def distance_from_goal(self):
        '''
        this function get us the current Euclidean distance from goal
        '''
        x_curr, y_curr = self.get_pose()
        distance = math.sqrt((self.x_goal-x_curr)**2 + (self.y_goal-y_curr)**2)

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
            # this state (x=0 , y =0) is undefined so we handle it seperately
            desired_angle = heading
        else:
            desired_angle = math.atan2(relative_y, relative_x)
        # the angle express howmuch we should rotate to reach the desired angle
        angle = heading - desired_angle
        # but we design controller and if the angle is bigger than 180 or less than -180
        # the robot must rotate alot so we should find its complementary to 360 degrees
        if angle < math.radians(-180):
            angle = math.radians(360)-abs(angle)
        elif angle > math.radians(180):
            angle = angle-math.radians(360)

        return angle
    
    def find_nearest_point(self):
        '''
        When the robot is placed in a world it should find the closest point
        of given path and move forward it. this function find the closest point.
        also we consider that, the robot when starting to move the nearest point 
        maybe changed so we should update the nearest point.
        '''
        curr_point = self.get_pose()
        goal_point = self.points[0]
        my_min_dist = self.get_distance(goal_point, curr_point)
        counter = 0
        for point in self.points:
            dist = self.get_distance(point, curr_point)
            if dist < my_min_dist:
                my_min_dist = dist
                goal_point = point
                self.index = counter
            counter += 1
        self.x_goal, self.y_goal = goal_point


    def make_rectangle(self):
        '''
        below code make sample points on a rectangle shape and  
        if we plot them show us a rectangle. we return the list of
        this points and each point also is a list like [x,y].
        length: 6
        width: 4
        '''
        X1 = np.linspace(-3, 3 , 100)
        Y1 = np.array([2]*100)

        Y2 = np.linspace(2, -2 , 100)
        X2 = np.array([3]*100)

        X3 = np.linspace(3, -3 , 100)
        Y3 = np.array([-2]*100)

        Y4 = np.linspace(-2, 2 , 100)
        X4 = np.array([-3]*100)

        X, Y = np.concatenate([X1,X2, X3 , X4]), np.concatenate([Y1,Y2,Y3,Y4])
        points = [[x, y] for x, y in zip(X, Y)]
        return points
    
 
    def make_star(self):
        '''
        below code make sample points on a star shape and  
        if we plot them show us a star. we return the list of
        this points and each point also is a list like [x,y].
        '''
        X1 = np.linspace(0, 3 , 100)
        Y1 = - (7/3) * X1  + 12

        X2 = np.linspace(3, 10 , 100)
        Y2 = np.array([5]*100)

        X3 = np.linspace(10, 4 , 100)
        Y3 = (5/6) * X3  - (10/3)

        X4 = np.linspace(4, 7 , 100)
        Y4 = -(3) * X4  + 12

        X5 = np.linspace(7, 0 , 100)
        Y5 = -(4/7) * X5  - 5

        X6 = np.linspace(0, -7 , 100)
        Y6 = (4/7) * X6  - 5

        X7 = np.linspace(-7, -4 , 100)
        Y7 = 3 * X7  + 12

        X8 = np.linspace(-4, -10 , 100)
        Y8 = -(5/6) * X8  - (10/3)

        X9 = np.linspace(-10, -3 , 100)
        Y9 = np.array([5]*100)

        X10 = np.linspace(-3, 0 , 100)
        Y10 = (7/3) * X10  + 12

        X, Y = np.concatenate([X1, X2, X3, X4, X5, X6, X7, X8, X9, X10]), np.concatenate([Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8, Y9, Y10])
        points = [[x, y] for x, y in zip(X, Y)]
        return points


    def make_logarithmic_spiral(self):
        '''
        below code make sample points on a logarithmic spiral shape and  
        if we plot them show us a logarithmic spiral. we return the list of
        this points and each point also is a list like [x,y].
        '''
        a = 0.17
        k = math.tan(a)
        X , Y = [] , []

        for i in range(150):
            t = i / 20 * math.pi
            dx = a * math.exp(k * t) * math.cos(t)
            dy = a * math.exp(k * t) * math.sin(t)
            X.append(dx)
            Y.append(dy) 

        points = [[x, y] for x, y in zip(X, Y)]
        return points
    
    def control(self):

        close_enough = False
        self.find_nearest_point()
        
        distance = self.distance_from_goal()    
        sum_i_dist = 0
        prev_error_dist = 0
        err_dist = distance - self.D

        angle = self.angle_from_goal()
        sum_i_angle = 0
        prev_error_angle = 0
        err_angle = angle - self.D
        
        move_cmd = Twist()

        while not rospy.is_shutdown():
              
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
            #rospy.loginfo(f"P_a : {P_a} I_a : {I_a} D_a : {D_a}")

            #rospy.loginfo(f"error_angle : {err_angle} error_dist: {err_dist} angular speed : {move_cmd.angular.z} linear speed : {move_cmd.linear.x}")
            
            # If distance from current goal is less than threshold then define new goal
            if err_dist < self.dist_threshold and err_angle < self.angle_threshold:
                close_enough = True
                self.index += self.index_increment

                # Note that for logarithmic_spiral if arrive to last point we dont continue
                # but for star and rectangle we continue until user make interrupt
                if self.shape == "logarithmic_spiral" and self.index > len(self.points)-1:
                    break
                self.x_goal, self.y_goal = self.points[self.index%len(self.points)]

            elif not close_enough: 
                self.find_nearest_point()
        
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
    