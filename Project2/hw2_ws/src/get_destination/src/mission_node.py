#!/usr/bin/python3

import rospy
from get_destination.srv import GetNextDestination, GetNextDestinationResponse
import random
import math

class Mission():

    def get_next_dest(self, current_loc):
        cur_x = current_loc.current_x
        cur_y = current_loc.current_y

        rospy.loginfo(f"Service : NEW CALL: {cur_x, cur_y}")

        next_x = random.uniform(-10,10)
        if abs(next_x - cur_x)>=5:
            next_y = random.uniform(-10,10)
        else:
            y_dist = (25 - (next_x - cur_x)**2)**0.5
            valid_min_y1 = cur_y + y_dist
            valid_min_y2 = cur_y - y_dist
            if valid_min_y1 >=10:
                next_y = random.uniform(-10, valid_min_y2)
            elif valid_min_y2 <= -10:
                next_y = random.uniform(valid_min_y1, 10)
            else:
                next_y = random.choice([random.uniform(-10, valid_min_y2), random.uniform(valid_min_y1, 10)])

        result = GetNextDestinationResponse()
        result.next_x = next_x
        result.next_y = next_y

        return result
    
def listener():

    rospy.init_node('mission', anonymous=True)
    mi = Mission()
    s = rospy.Service('get_destination', GetNextDestination, mi.get_next_dest)

    rospy.spin()

if __name__ == '__main__':
    listener()

