#!/usr/bin/env python3
import rospy
from sensor_msgs.msg import LaserScan
from distance_calculator.srv import GetDistance, GetDistanceResponse

class Distance_calculator():
    def __init__(self) -> None:
        self.front_dis = -1
        self.left_dis = -1
        self.behind_dis = -1
        self.right_dis = -1

    def read_distance(self, data):
        ranges = data.ranges
        front_ranges = ranges[-5:0] + ranges[1:4]
        left_ranges = ranges[85:94]
        behind_ranges = ranges[175:184]
        right_ranges = ranges[265:274]

        self.front_dis = min(front_ranges)
        self.right_dis = min(right_ranges)
        self.behind_dis = min(behind_ranges)
        self.left_dis = min(left_ranges)

    def get_distance(self, req):
        direction_name = req.direction_name
        rospy.loginfo(f"NEW CALL: {direction_name}")
        distance = -1
        if direction_name == 'front':
            distance = self.front_dis
        elif direction_name == 'left':
            distance = self.left_dis
        elif direction_name == 'behind':
            distance = self.behind_dis
        elif direction_name == 'right':
            distance = self.right_dis
        else:
            rospy.logerr(f'direction_name is not valid: {direction_name}')
            return None
        res = GetDistanceResponse()
        res.distance = distance

        return res
    
def listener():

    rospy.init_node('distance_calculator_node', anonymous=True)
    dc = Distance_calculator()
    rospy.Subscriber("/scan", LaserScan, dc.read_distance)
    s = rospy.Service('get_distance', GetDistance, dc.get_distance)
    rospy.spin()

if __name__ == '__main__':
    listener()