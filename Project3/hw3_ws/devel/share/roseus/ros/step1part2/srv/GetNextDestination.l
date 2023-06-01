;; Auto-generated. Do not edit!


(when (boundp 'step1part2::GetNextDestination)
  (if (not (find-package "STEP1PART2"))
    (make-package "STEP1PART2"))
  (shadow 'GetNextDestination (find-package "STEP1PART2")))
(unless (find-package "STEP1PART2::GETNEXTDESTINATION")
  (make-package "STEP1PART2::GETNEXTDESTINATION"))
(unless (find-package "STEP1PART2::GETNEXTDESTINATIONREQUEST")
  (make-package "STEP1PART2::GETNEXTDESTINATIONREQUEST"))
(unless (find-package "STEP1PART2::GETNEXTDESTINATIONRESPONSE")
  (make-package "STEP1PART2::GETNEXTDESTINATIONRESPONSE"))

(in-package "ROS")





(defclass step1part2::GetNextDestinationRequest
  :super ros::object
  :slots (_current_x _current_y ))

(defmethod step1part2::GetNextDestinationRequest
  (:init
   (&key
    ((:current_x __current_x) 0.0)
    ((:current_y __current_y) 0.0)
    )
   (send-super :init)
   (setq _current_x (float __current_x))
   (setq _current_y (float __current_y))
   self)
  (:current_x
   (&optional __current_x)
   (if __current_x (setq _current_x __current_x)) _current_x)
  (:current_y
   (&optional __current_y)
   (if __current_y (setq _current_y __current_y)) _current_y)
  (:serialization-length
   ()
   (+
    ;; float64 _current_x
    8
    ;; float64 _current_y
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _current_x
       (sys::poke _current_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _current_y
       (sys::poke _current_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _current_x
     (setq _current_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _current_y
     (setq _current_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass step1part2::GetNextDestinationResponse
  :super ros::object
  :slots (_next_x _next_y ))

(defmethod step1part2::GetNextDestinationResponse
  (:init
   (&key
    ((:next_x __next_x) 0.0)
    ((:next_y __next_y) 0.0)
    )
   (send-super :init)
   (setq _next_x (float __next_x))
   (setq _next_y (float __next_y))
   self)
  (:next_x
   (&optional __next_x)
   (if __next_x (setq _next_x __next_x)) _next_x)
  (:next_y
   (&optional __next_y)
   (if __next_y (setq _next_y __next_y)) _next_y)
  (:serialization-length
   ()
   (+
    ;; float64 _next_x
    8
    ;; float64 _next_y
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _next_x
       (sys::poke _next_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _next_y
       (sys::poke _next_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _next_x
     (setq _next_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _next_y
     (setq _next_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass step1part2::GetNextDestination
  :super ros::object
  :slots ())

(setf (get step1part2::GetNextDestination :md5sum-) "09f8b596f17567f03b1180688311653f")
(setf (get step1part2::GetNextDestination :datatype-) "step1part2/GetNextDestination")
(setf (get step1part2::GetNextDestination :request) step1part2::GetNextDestinationRequest)
(setf (get step1part2::GetNextDestination :response) step1part2::GetNextDestinationResponse)

(defmethod step1part2::GetNextDestinationRequest
  (:response () (instance step1part2::GetNextDestinationResponse :init)))

(setf (get step1part2::GetNextDestinationRequest :md5sum-) "09f8b596f17567f03b1180688311653f")
(setf (get step1part2::GetNextDestinationRequest :datatype-) "step1part2/GetNextDestinationRequest")
(setf (get step1part2::GetNextDestinationRequest :definition-)
      "float64 current_x
float64 current_y
---
float64 next_x
float64 next_y
")

(setf (get step1part2::GetNextDestinationResponse :md5sum-) "09f8b596f17567f03b1180688311653f")
(setf (get step1part2::GetNextDestinationResponse :datatype-) "step1part2/GetNextDestinationResponse")
(setf (get step1part2::GetNextDestinationResponse :definition-)
      "float64 current_x
float64 current_y
---
float64 next_x
float64 next_y
")



(provide :step1part2/GetNextDestination "09f8b596f17567f03b1180688311653f")


