;; Auto-generated. Do not edit!


(when (boundp 'turtlebot3_object_tracker::detection)
  (if (not (find-package "TURTLEBOT3_OBJECT_TRACKER"))
    (make-package "TURTLEBOT3_OBJECT_TRACKER"))
  (shadow 'detection (find-package "TURTLEBOT3_OBJECT_TRACKER")))
(unless (find-package "TURTLEBOT3_OBJECT_TRACKER::DETECTION")
  (make-package "TURTLEBOT3_OBJECT_TRACKER::DETECTION"))
(unless (find-package "TURTLEBOT3_OBJECT_TRACKER::DETECTIONREQUEST")
  (make-package "TURTLEBOT3_OBJECT_TRACKER::DETECTIONREQUEST"))
(unless (find-package "TURTLEBOT3_OBJECT_TRACKER::DETECTIONRESPONSE")
  (make-package "TURTLEBOT3_OBJECT_TRACKER::DETECTIONRESPONSE"))

(in-package "ROS")





(defclass turtlebot3_object_tracker::detectionRequest
  :super ros::object
  :slots (_label ))

(defmethod turtlebot3_object_tracker::detectionRequest
  (:init
   (&key
    ((:label __label) "")
    )
   (send-super :init)
   (setq _label (string __label))
   self)
  (:label
   (&optional __label)
   (if __label (setq _label __label)) _label)
  (:serialization-length
   ()
   (+
    ;; string _label
    4 (length _label)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _label
       (write-long (length _label) s) (princ _label s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _label
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _label (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass turtlebot3_object_tracker::detectionResponse
  :super ros::object
  :slots (_xc _yc _width _height _image_x _image_y ))

(defmethod turtlebot3_object_tracker::detectionResponse
  (:init
   (&key
    ((:xc __xc) 0.0)
    ((:yc __yc) 0.0)
    ((:width __width) 0.0)
    ((:height __height) 0.0)
    ((:image_x __image_x) 0.0)
    ((:image_y __image_y) 0.0)
    )
   (send-super :init)
   (setq _xc (float __xc))
   (setq _yc (float __yc))
   (setq _width (float __width))
   (setq _height (float __height))
   (setq _image_x (float __image_x))
   (setq _image_y (float __image_y))
   self)
  (:xc
   (&optional __xc)
   (if __xc (setq _xc __xc)) _xc)
  (:yc
   (&optional __yc)
   (if __yc (setq _yc __yc)) _yc)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:image_x
   (&optional __image_x)
   (if __image_x (setq _image_x __image_x)) _image_x)
  (:image_y
   (&optional __image_y)
   (if __image_y (setq _image_y __image_y)) _image_y)
  (:serialization-length
   ()
   (+
    ;; float64 _xc
    8
    ;; float64 _yc
    8
    ;; float64 _width
    8
    ;; float64 _height
    8
    ;; float64 _image_x
    8
    ;; float64 _image_y
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _xc
       (sys::poke _xc (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yc
       (sys::poke _yc (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _width
       (sys::poke _width (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _height
       (sys::poke _height (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _image_x
       (sys::poke _image_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _image_y
       (sys::poke _image_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _xc
     (setq _xc (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yc
     (setq _yc (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _width
     (setq _width (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _height
     (setq _height (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _image_x
     (setq _image_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _image_y
     (setq _image_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass turtlebot3_object_tracker::detection
  :super ros::object
  :slots ())

(setf (get turtlebot3_object_tracker::detection :md5sum-) "192eaad7a30f7ee7738f9a5ce264f551")
(setf (get turtlebot3_object_tracker::detection :datatype-) "turtlebot3_object_tracker/detection")
(setf (get turtlebot3_object_tracker::detection :request) turtlebot3_object_tracker::detectionRequest)
(setf (get turtlebot3_object_tracker::detection :response) turtlebot3_object_tracker::detectionResponse)

(defmethod turtlebot3_object_tracker::detectionRequest
  (:response () (instance turtlebot3_object_tracker::detectionResponse :init)))

(setf (get turtlebot3_object_tracker::detectionRequest :md5sum-) "192eaad7a30f7ee7738f9a5ce264f551")
(setf (get turtlebot3_object_tracker::detectionRequest :datatype-) "turtlebot3_object_tracker/detectionRequest")
(setf (get turtlebot3_object_tracker::detectionRequest :definition-)
      "string label
---
float64 xc
float64 yc
float64 width
float64 height
float64 image_x
float64 image_y
")

(setf (get turtlebot3_object_tracker::detectionResponse :md5sum-) "192eaad7a30f7ee7738f9a5ce264f551")
(setf (get turtlebot3_object_tracker::detectionResponse :datatype-) "turtlebot3_object_tracker/detectionResponse")
(setf (get turtlebot3_object_tracker::detectionResponse :definition-)
      "string label
---
float64 xc
float64 yc
float64 width
float64 height
float64 image_x
float64 image_y
")



(provide :turtlebot3_object_tracker/detection "192eaad7a30f7ee7738f9a5ce264f551")


