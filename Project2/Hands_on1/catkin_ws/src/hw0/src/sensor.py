#!/usr/bin/python3

import rospy
from std_msgs.msg import String
from hw0.msg import proximity

def talker():
    pub = rospy.Publisher("distance", proximity, queue_size= 10)
    rospy.init_node("sensor", anonymous=True)
    rate = rospy.Rate(1) #Hz

    while not rospy.is_shutdown():
        msg = proximity()
        msg.up = 10
        msg.down = 20
        msg.left = 30
        msg.right = 40

        rospy.loginfo(msg)
        pub.publish(msg)
        rate.sleep()

if __name__=="__main__":
    talker()