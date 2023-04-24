#!/usr/bin/python3

import rospy
from obstacle_detect.msg import closest_obstacle
from sensor_msgs.msg import LaserScan

class Sensor():

    def __init__(self) -> None:
        rospy.init_node('sensor', anonymous=True)
        self.pub = rospy.Publisher('ClosestObstacle', closest_obstacle, queue_size=10)
        self.laser_subscriber = rospy.Subscriber("/scan" , LaserScan , callback=self.laser_callback)
        self.rate = rospy.Rate(0.2) #Hz
        self.closest_msg = closest_obstacle()

    def laser_callback(self, msg: LaserScan):
        min_dist = min(msg.ranges)
        direction = msg.ranges.index(min_dist)
        self.closest_msg.distnace = min_dist
        self.closest_msg.direction = direction

    def run(self):

        while not rospy.is_shutdown():
            rospy.loginfo(f' closest obtacle {self.closest_msg}')
            self.pub.publish(self.closest_msg)
            self.rate.sleep()

if __name__ == '__main__':
    my_sensor = Sensor()
    my_sensor.run()
