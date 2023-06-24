#!/usr/bin/python3

# Python
import copy

# Object detection
import cv2
import numpy as np
from ultralytics import YOLO
from ultralytics.yolo.utils.plotting import Annotator
from ultralytics.yolo.engine.results import Results
import torch

# ROS
import rospy
from sensor_msgs.msg import Image

# detection service
from turtlebot3_object_tracker.srv import detection, detectionResponse

class ImageProcessor:
    def __init__(self) -> None:
        # Image message
        self.image_msg = Image()

        self.image_res = 240, 320, 3 # Camera resolution: height, width
        self.image_np = np.zeros(self.image_res) # The numpy array to pour the image data into

        # TODO: Subscribe on your robot's camera topic
        # NOTE: Make sure you use the provided listener for this subscription
        self.camera_subscriber = rospy.Subscriber("/follower/camera/image",Image,self.camera_listener)

        # TODO: Instantiate your YOLO object detector/classifier model
        self.model: YOLO = YOLO('../yolo/yolov8n.pt')

        # TODO: You need to update results each time you call your model
        self.results: Results = None

        self.cv2_frame_size = 400, 320
        cv2.namedWindow("robot_view", cv2.WINDOW_NORMAL)
        cv2.resizeWindow("robot_view", *self.cv2_frame_size)

        # TODO: Setup your "human detection" service
        self.human_detection_server = rospy.Service('detection', detection, self.service_callback)

        self.update_view()


    def camera_listener(self, msg: Image):
        self.image_msg.data = copy.deepcopy(msg.data)


    def service_callback(self, input):

        self.results = self.model(self.image_np)
        target_result = self.results[0]
        
        service_output = detectionResponse()
        service_output.image_x, service_output.image_y = self.image_res[1]/2, self.image_res[0]/2

        for box in target_result.boxes:
            id = box.cls

            if self.model.names[int(id)] == input.label:
                # get box coordinates in (xc, yc, w, h) format 
                # (box center) -> (xc,yc)
                # (width and height of box) -> (w,h)
                box_coordinates = box.xywh
                service_output.xc, service_output.yc, service_output.width, service_output.height = box_coordinates.tolist()[0]
                return service_output
            
        service_output.xc, service_output.yc, service_output.width, service_output.height = 1000, 1000, 1000, 1000
        return service_output

    def update_view(self):
        try:
            while not rospy.is_shutdown():
                if len(self.image_msg.data) == 0: # If there is no image data
                    continue

                # Convert binary image data to numpy array
                self.image_np = np.frombuffer(self.image_msg.data, dtype=np.uint8)
                self.image_np = self.image_np.reshape(self.image_res)

                self.results = self.model(self.image_np)
                frame = copy.deepcopy(self.image_np)

                # TODO: You can use an "Annotator" to draw object bounding boxes on frame
                for res in self.results:
                    annotator = Annotator(frame)
                    boxes = res.boxes
                    for box in boxes:
                        # get box coordinates in (x1, y1, x2, y2) format 
                        # (top left corner) -> (x1,y1)
                        # (bottom right corner) -> (x2,y2)
                        box_coordinates = box.xyxy[0]
                        object_id = box.cls
                        annotator.box_label(box_coordinates, self.model.names[int(object_id)])
                        
                cv2.imshow("robot_view", cv2.cvtColor(frame, cv2.COLOR_RGB2BGR))
                cv2.waitKey(1)

        except rospy.exceptions.ROSInterruptException:
            pass


if __name__ == "__main__":
    rospy.init_node("image_processor", anonymous=True)

    rospy.on_shutdown(cv2.destroyAllWindows)

    image_processor = ImageProcessor()

    rospy.spin()


