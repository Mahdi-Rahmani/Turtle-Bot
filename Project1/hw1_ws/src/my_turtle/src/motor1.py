#!/usr/bin/python3

import rospy 
from my_turtle.msg import orientation

def callback(data):
    rospy.loginfo("\nreceived data in motor1\n %s%s", data,"\n")

def listener():
    # In ROS, nodes are uniquely named. If two nodes with the same
    # name are launched, the previous one is kicked off. The
    # anonymous=True flag means that rospy will choose a unique
    # name for our 'motor1' node so that multiple motor1s can
    # run simultaneously.
    rospy.init_node('motor1', anonymous=True)

    rospy.Subscriber("motor1", orientation, callback)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    listener()