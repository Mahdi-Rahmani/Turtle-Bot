;; Auto-generated. Do not edit!


(when (boundp 'get_destination::GetNextDestination)
  (if (not (find-package "GET_DESTINATION"))
    (make-package "GET_DESTINATION"))
  (shadow 'GetNextDestination (find-package "GET_DESTINATION")))
(unless (find-package "GET_DESTINATION::GETNEXTDESTINATION")
  (make-package "GET_DESTINATION::GETNEXTDESTINATION"))
(unless (find-package "GET_DESTINATION::GETNEXTDESTINATIONREQUEST")
  (make-package "GET_DESTINATION::GETNEXTDESTINATIONREQUEST"))
(unless (find-package "GET_DESTINATION::GETNEXTDESTINATIONRESPONSE")
  (make-package "GET_DESTINATION::GETNEXTDESTINATIONRESPONSE"))

(in-package "ROS")





(defclass get_destination::GetNextDestinationRequest
  :super ros::object
  :slots (_current_x _current_y ))

(defmethod get_destination::GetNextDestinationRequest
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

(defclass get_destination::GetNextDestinationResponse
  :super ros::object
  :slots (_next_x _next_y ))

(defmethod get_destination::GetNextDestinationResponse
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

(defclass get_destination::GetNextDestination
  :super ros::object
  :slots ())

(setf (get get_destination::GetNextDestination :md5sum-) "09f8b596f17567f03b1180688311653f")
(setf (get get_destination::GetNextDestination :datatype-) "get_destination/GetNextDestination")
(setf (get get_destination::GetNextDestination :request) get_destination::GetNextDestinationRequest)
(setf (get get_destination::GetNextDestination :response) get_destination::GetNextDestinationResponse)

(defmethod get_destination::GetNextDestinationRequest
  (:response () (instance get_destination::GetNextDestinationResponse :init)))

(setf (get get_destination::GetNextDestinationRequest :md5sum-) "09f8b596f17567f03b1180688311653f")
(setf (get get_destination::GetNextDestinationRequest :datatype-) "get_destination/GetNextDestinationRequest")
(setf (get get_destination::GetNextDestinationRequest :definition-)
      "float64 current_x
float64 current_y
---
float64 next_x
float64 next_y
")

(setf (get get_destination::GetNextDestinationResponse :md5sum-) "09f8b596f17567f03b1180688311653f")
(setf (get get_destination::GetNextDestinationResponse :datatype-) "get_destination/GetNextDestinationResponse")
(setf (get get_destination::GetNextDestinationResponse :definition-)
      "float64 current_x
float64 current_y
---
float64 next_x
float64 next_y
")



(provide :get_destination/GetNextDestination "09f8b596f17567f03b1180688311653f")


