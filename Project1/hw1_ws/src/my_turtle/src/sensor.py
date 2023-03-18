#!/usr/bin/python3

import rospy
from std_msgs.msg import String
import random
from my_turtle.msg import proximity

def talker():
    pub = rospy.Publisher("distance", proximity, queue_size= 10)
    rospy.init_node("sensor", anonymous=True)
    rate = rospy.Rate(0.2) #Hz

    while not rospy.is_shutdown():
        msg = proximity()
        msg.up = random.randint(10, 200)
        msg.down = random.randint(10, 200)
        msg.left = random.randint(10, 200)
        msg.right = random.randint(10, 200)

        rospy.loginfo("\npublished data from sensor:\n%s%s",msg,"\n")
        pub.publish(msg)
        rate.sleep()

if __name__=="__main__":
    talker()