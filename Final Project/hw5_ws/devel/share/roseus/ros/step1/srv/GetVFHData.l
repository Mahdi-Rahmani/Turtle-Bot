;; Auto-generated. Do not edit!


(when (boundp 'step1::GetVFHData)
  (if (not (find-package "STEP1"))
    (make-package "STEP1"))
  (shadow 'GetVFHData (find-package "STEP1")))
(unless (find-package "STEP1::GETVFHDATA")
  (make-package "STEP1::GETVFHDATA"))
(unless (find-package "STEP1::GETVFHDATAREQUEST")
  (make-package "STEP1::GETVFHDATAREQUEST"))
(unless (find-package "STEP1::GETVFHDATARESPONSE")
  (make-package "STEP1::GETVFHDATARESPONSE"))

(in-package "ROS")





(defclass step1::GetVFHDataRequest
  :super ros::object
  :slots (_goal_x _goal_y _threshold ))

(defmethod step1::GetVFHDataRequest
  (:init
   (&key
    ((:goal_x __goal_x) 0.0)
    ((:goal_y __goal_y) 0.0)
    ((:threshold __threshold) 0.0)
    )
   (send-super :init)
   (setq _goal_x (float __goal_x))
   (setq _goal_y (float __goal_y))
   (setq _threshold (float __threshold))
   self)
  (:goal_x
   (&optional __goal_x)
   (if __goal_x (setq _goal_x __goal_x)) _goal_x)
  (:goal_y
   (&optional __goal_y)
   (if __goal_y (setq _goal_y __goal_y)) _goal_y)
  (:threshold
   (&optional __threshold)
   (if __threshold (setq _threshold __threshold)) _threshold)
  (:serialization-length
   ()
   (+
    ;; float64 _goal_x
    8
    ;; float64 _goal_y
    8
    ;; float64 _threshold
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _goal_x
       (sys::poke _goal_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _goal_y
       (sys::poke _goal_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _threshold
       (sys::poke _threshold (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _goal_x
     (setq _goal_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _goal_y
     (setq _goal_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _threshold
     (setq _threshold (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass step1::GetVFHDataResponse
  :super ros::object
  :slots (_desired_angle _h_prim_c ))

(defmethod step1::GetVFHDataResponse
  (:init
   (&key
    ((:desired_angle __desired_angle) 0.0)
    ((:h_prim_c __h_prim_c) 0.0)
    )
   (send-super :init)
   (setq _desired_angle (float __desired_angle))
   (setq _h_prim_c (float __h_prim_c))
   self)
  (:desired_angle
   (&optional __desired_angle)
   (if __desired_angle (setq _desired_angle __desired_angle)) _desired_angle)
  (:h_prim_c
   (&optional __h_prim_c)
   (if __h_prim_c (setq _h_prim_c __h_prim_c)) _h_prim_c)
  (:serialization-length
   ()
   (+
    ;; float64 _desired_angle
    8
    ;; float64 _h_prim_c
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _desired_angle
       (sys::poke _desired_angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _h_prim_c
       (sys::poke _h_prim_c (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _desired_angle
     (setq _desired_angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _h_prim_c
     (setq _h_prim_c (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass step1::GetVFHData
  :super ros::object
  :slots ())

(setf (get step1::GetVFHData :md5sum-) "7afd2a141a3ca51e86f2fbc885cf9fc7")
(setf (get step1::GetVFHData :datatype-) "step1/GetVFHData")
(setf (get step1::GetVFHData :request) step1::GetVFHDataRequest)
(setf (get step1::GetVFHData :response) step1::GetVFHDataResponse)

(defmethod step1::GetVFHDataRequest
  (:response () (instance step1::GetVFHDataResponse :init)))

(setf (get step1::GetVFHDataRequest :md5sum-) "7afd2a141a3ca51e86f2fbc885cf9fc7")
(setf (get step1::GetVFHDataRequest :datatype-) "step1/GetVFHDataRequest")
(setf (get step1::GetVFHDataRequest :definition-)
      "float64 goal_x
float64 goal_y
float64 threshold
---
float64 desired_angle
float64 h_prim_c
")

(setf (get step1::GetVFHDataResponse :md5sum-) "7afd2a141a3ca51e86f2fbc885cf9fc7")
(setf (get step1::GetVFHDataResponse :datatype-) "step1/GetVFHDataResponse")
(setf (get step1::GetVFHDataResponse :definition-)
      "float64 goal_x
float64 goal_y
float64 threshold
---
float64 desired_angle
float64 h_prim_c
")



(provide :step1/GetVFHData "7afd2a141a3ca51e86f2fbc885cf9fc7")


