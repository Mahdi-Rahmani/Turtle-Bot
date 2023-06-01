#!/usr/bin/python3

import rospy
from step1part2.srv import GetNextDestination, GetNextDestinationResponse
import random

class Mission():

    def __init__(self):
        # minimum distance from next point
        self.min_distance = 10
        # maximum and minimum x and y in grid
        self.max_x_y = 20
        self.min_x_y = -20

    def get_next_dest(self, current_loc):
        cur_x = current_loc.current_x
        cur_y = current_loc.current_y

        rospy.loginfo(f"Service : NEW CALL: {cur_x, cur_y}")

        next_x = random.uniform(self.min_x_y, self.max_x_y)
        # if random x is far enough so we don't need to calculate Euclidean distance and cosidering y
        if abs(next_x - cur_x)>=self.min_distance:
            next_y = random.uniform(self.min_x_y, self.max_x_y)
        else:
            y_dist = (self.min_distance**2 - (next_x - cur_x)**2)**0.5
            valid_min_y1 = cur_y + y_dist
            valid_min_y2 = cur_y - y_dist
            if valid_min_y1 >= self.max_x_y:
                next_y = random.uniform(self.min_x_y, valid_min_y2)
            elif valid_min_y2 <= self.min_x_y:
                next_y = random.uniform(valid_min_y1, self.max_x_y)
            else:
                next_y = random.choice([random.uniform(self.min_x_y, valid_min_y2), random.uniform(valid_min_y1, self.max_x_y)])

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
