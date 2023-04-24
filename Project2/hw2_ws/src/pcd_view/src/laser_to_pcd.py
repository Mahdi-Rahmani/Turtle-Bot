#!/usr/bin/python3

import rospy 
from laser_assembler.srv import AssembleScans2
from sensor_msgs.msg import PointCloud2

class PointCloud():
    def __init__(self) -> None:
        rospy.init_node("laser_to_pcd")
        rospy.wait_for_service("assemble_scans2")
        self.assemble_scans = rospy.ServiceProxy('assemble_scans2', AssembleScans2)
        self.pub = rospy.Publisher ("/laser_pointcloud", PointCloud2, queue_size=1)

    def run(self):
        while not rospy.is_shutdown():
            try:
                resp = self.assemble_scans(rospy.Time(0,0), rospy.get_rostime())
                #rospy.loginfo("Got cloud with %u points" % len(resp.cloud.data))
                self.pub.publish(resp.cloud)

            except rospy.ServiceException as e:
                rospy.loginfo("Service call failed: %s" %e)

            rospy.sleep(1)

if __name__ == '__main__':
    pcd = PointCloud()
    pcd.run()