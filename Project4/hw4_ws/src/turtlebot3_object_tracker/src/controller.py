#!/usr/bin/python3

# ROS
import rospy
from geometry_msgs.msg import Twist

# detection service
from turtlebot3_object_tracker.srv import detection, detectionRequest

class Controller:
    def __init__(self) -> None:
        # Use these Twists to control your robot
        self.move = Twist()
        self.move.linear.x = 0.1
        self.freeze = Twist()

        # The "p" parameter for your p-controller, TODO: you need to tune this
        self.angular_vel_coef = 0.002

        # TODO: Create a service proxy for your human detection service
        rospy.wait_for_service('detection')
        self.calc_client = rospy.ServiceProxy('detection', detection)

        # TODO: Create a publisher for your robot "cmd_vel"
        self.cmd_publisher = rospy.Publisher('/follower/cmd_vel' , Twist , queue_size=10)

    def run(self) -> None:
        try:
            while not rospy.is_shutdown():
                # TODO: Call your service, ride your robot
                req = detectionRequest()
                req.label = 'person'

                resp = self.calc_client(req)

                if resp.xc == 1000:

                    self.cmd_publisher.publish(self.freeze)

                else:

                    person_x, person_y = resp.xc, resp.yc
                    image_center_x, image_center_y = resp.image_x, resp.image_y

                    error = person_x-image_center_x
                    angular_velocity = self.angular_vel_coef*(error)

                    self.move.angular.z = -angular_velocity
                    self.cmd_publisher.publish(self.move)

        except rospy.exceptions.ROSInterruptException:
            pass
                

if __name__ == "__main__":
    rospy.init_node("controller", anonymous=True)
    
    controller = Controller()
    controller.run()
    

