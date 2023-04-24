#!/usr/bin/python3

import rospy
import tf
import math
from nav_msgs.msg import Odometry
from geometry_msgs.msg import Twist
from get_destination.srv import GetNextDestination, GetNextDestinationRequest

class Controller():
    def __init__(self) -> None:
        rospy.init_node("controller" , anonymous=False)
        rospy.wait_for_service('get_destination')
        self.calc_client = rospy.ServiceProxy('get_destination', GetNextDestination)
        self.cmd_publisher = rospy.Publisher('/cmd_vel' , Twist , queue_size=10)

        self.linear_speed = rospy.get_param("/controller/linear_speed") # m/s
        self.angular_speed = 0.08
        self.epsilon = 0.17
        self.current_x = 0
        self.current_y = 0
        self.yaw = 90

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
    
    # position of robot
    def get_pose(self):
        # waiting for the most recent message from topic /odom
        msg = rospy.wait_for_message("/odom" , Odometry)

        position = msg.pose.pose.position

        return position.x, position.y
      
    def run(self):
        error_array = []
        counter = 0
        while not rospy.is_shutdown():
            counter += 1
            if counter == 6:
                break
            # first we should send our current location to service for 
            # getting next destination
            req = GetNextDestinationRequest()
            req.current_x = self.current_x
            req.current_y = self.current_y
            rospy.loginfo(f"Client : current pose: {req.current_x, req.current_y}")
            resp = self.calc_client(req)
            rospy.loginfo(f"Client : Goal pose : {resp.next_x, resp.next_y}")

            # according to the next destination we should calculate our desired angle
            # for finding desired angle we should find next location relative robot position
            new_next_x = resp.next_x - self.current_x
            new_next_y = resp.next_y - self.current_y
            sin = new_next_y/math.sqrt(new_next_x**2+new_next_y**2)
            cos = new_next_x/math.sqrt(new_next_x**2+new_next_y**2)
            sin_inv = math.degrees(math.asin(sin))

            if cos >= 0:
                desired_angle = sin_inv
            elif cos <= 0 and sin >=0:
                desired_angle = 180 - sin_inv
            else:
                desired_angle = -180 - sin_inv
            
            rospy.loginfo(f"Client: desired angle : {desired_angle}\n")

            # our robot start to rotate
            twist = Twist()
            if 90<=desired_angle<=180 or -180<=desired_angle<=-90:
                twist.angular.z = self.angular_speed
            else:
                twist.angular.z = -self.angular_speed

            while abs(self.yaw - desired_angle) >= self.epsilon:
                self.yaw = self.get_heading()
                self.cmd_publisher.publish(twist)
                #rospy.loginfo(f"yaw: {self.yaw}")
            
            # our robot reached to its desired angle and now should be stopped
            self.cmd_publisher.publish(Twist())

            rospy.sleep(2)

            # now we should go sraight to reach our destination
            twist = Twist()
            twist.linear.x = self.linear_speed
            self.cmd_publisher.publish(twist)
            desired_distance = math.sqrt((self.current_x-resp.next_x)**2 + (self.current_y-resp.next_y)**2)
            prev_x = self.current_x
            prev_y = self.current_y
            walked_distance = math.sqrt((self.current_x-prev_x)**2 + (self.current_y-prev_y)**2)

            while abs(desired_distance-walked_distance) >= self.epsilon:
                self.current_x, self.current_y = self.get_pose()
                walked_distance = math.sqrt((self.current_x-prev_x)**2 + (self.current_y-prev_y)**2)

            self.cmd_publisher.publish(Twist())

            # calculate error and append to list
            self.current_x, self.current_y = self.get_pose()
            error_array.append(math.sqrt((self.current_x-resp.next_x)**2+(self.current_y-resp.next_y)**2))

            rospy.sleep(2)

        rospy.loginfo(f"TOTAL ERROR (in meter): {sum(error_array)/len(error_array)}")

if __name__ == "__main__":
    controller = Controller()
    
    controller.run()
    