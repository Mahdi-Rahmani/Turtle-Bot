#!/usr/bin/python3

import rospy 
from std_msgs.msg import String
from my_turtle.msg import proximity
from my_turtle.msg import orientation

# some global variables
state = "north"
states = ["east", "south", "west", "north"]

pub1 = None
pub2 = None

def callback(data):
    global state, states
    rospy.loginfo("previous state: "+state)
    rospy.loginfo("received data in controller:\n%s", data)

    # we can define message and initialize it with some default value
    # if the obstacle nearest to the down(back) side these deafault values remain without any changes
    msg = orientation()
    msg.direction = "dont rotate"
    msg.value = 0

    # I consider that down means back of robot
    # sequence in below list is important and they are placed clockwise
    # and also I want differnces in their index show us the direction
    distances = [data.right, data.down, data.left, data.up]
    min_distance = min(distances)
    min_distance_index = distances.index(min_distance)

    if min_distance != distances[1]:
        # direction coef tell us howmany 90 degrees in which direction we should rotate
        direction_coefficient = min_distance_index - 1
        
        # assign direction to msg.direction variable
        if direction_coefficient < 0:
            msg.direction = "counter clockwise"
        else:
            msg.direction = "clockwise"

        # assign value of orientation in degree to msg.value
        msg.value = abs(direction_coefficient) * 90

        # update state of robot after orientation 
        state = states[(states.index(state)+direction_coefficient)%4]

    rospy.loginfo("new state: "+state+"\n\n")

    # now we should publish message to both motors
    pub1.publish(msg)
    pub2.publish(msg)

def listener_talker():
    global pub1, pub2
    # In ROS, nodes are uniquely named. If two nodes with the same
    # name are launched, the previous one is kicked off. The
    # anonymous=True flag means that rospy will choose a unique
    # name for our 'controller' node so that multiple controllers can
    # run simultaneously.
    rospy.init_node('controller', anonymous=True)

    pub1 = rospy.Publisher("motor1", orientation, queue_size= 10)
    pub2 = rospy.Publisher("motor2", orientation, queue_size= 10)

    rospy.Subscriber("distance", proximity, callback)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    listener_talker()