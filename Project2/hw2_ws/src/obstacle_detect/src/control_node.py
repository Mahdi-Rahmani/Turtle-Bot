#!/usr/bin/python3

import rospy
import tf
import math
from nav_msgs.msg import Odometry
from geometry_msgs.msg import Twist
from obstacle_detect.msg import closest_obstacle

class Controller():
    def __init__(self) -> None:
        rospy.init_node("controller" , anonymous=False)
        rospy.Subscriber('ClosestObstacle', closest_obstacle, self.closest_callback)
        self.cmd_publisher = rospy.Publisher('/cmd_vel' , Twist , queue_size=10)

        self.linear_speed = 0.2 # m/s
        self.angular_speed = 0.2

        self.closest_obstacle = closest_obstacle()

    def closest_callback(self, data):
        self.closest_obstacle = data

    # heading of the robot 
    def get_heading(self):
        # waiting for the most recent message from topic /odom
        msg = rospy.wait_for_message("/odom" , Odometry)
        
        orientation = msg.pose.pose.orientation

        # convert quaternion to odom
        roll, pitch, yaw = tf.transformations.euler_from_quaternion((
            orientation.x ,orientation.y ,orientation.z ,orientation.w
        )) 
        
        return math.degrees(yaw)
    
    
    def move(self, mode, direction=0):

        twist = Twist()
        self.cmd_publisher.publish(twist)
        rospy.sleep(1)

        if mode == "rotate":
            first_heading = self.get_heading()
            if direction <= 180:
                while abs(self.get_heading()-first_heading) < (180-direction):
                    twist.angular.z = -self.angular_speed
                    self.cmd_publisher.publish(twist)
            else:
                while abs(self.get_heading()-first_heading) < (direction-180):
                    twist.angular.z = -self.angular_speed
                    self.cmd_publisher.publish(twist)

        elif mode == "go_straight":
            twist.linear.x = self.linear_speed
            self.cmd_publisher.publish(twist)

        else:
            rospy.loginfo('the mode is not correct')

        
    def run(self):

        sensor_is_ready = False
        self.move("go_straight")

        while not rospy.is_shutdown():

            dist, direction = self.closest_obstacle.distnace, self.closest_obstacle.direction

            if dist == 0.0 and direction == 0.0 and not sensor_is_ready:
                continue
            sensor_is_ready = True

            if dist < 2 and not (120 < direction < 240):
                rospy.loginfo(f'controller : {dist, direction}')
                self.move("rotate", direction)
                self.move("go_straight")


if __name__ == "__main__":

    controller = Controller()
    
    controller.run()
    