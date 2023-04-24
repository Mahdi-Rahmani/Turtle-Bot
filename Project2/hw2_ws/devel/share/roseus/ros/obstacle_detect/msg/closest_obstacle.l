;; Auto-generated. Do not edit!


(when (boundp 'obstacle_detect::closest_obstacle)
  (if (not (find-package "OBSTACLE_DETECT"))
    (make-package "OBSTACLE_DETECT"))
  (shadow 'closest_obstacle (find-package "OBSTACLE_DETECT")))
(unless (find-package "OBSTACLE_DETECT::CLOSEST_OBSTACLE")
  (make-package "OBSTACLE_DETECT::CLOSEST_OBSTACLE"))

(in-package "ROS")
;;//! \htmlinclude closest_obstacle.msg.html


(defclass obstacle_detect::closest_obstacle
  :super ros::object
  :slots (_distnace _direction ))

(defmethod obstacle_detect::closest_obstacle
  (:init
   (&key
    ((:distnace __distnace) 0.0)
    ((:direction __direction) 0.0)
    )
   (send-super :init)
   (setq _distnace (float __distnace))
   (setq _direction (float __direction))
   self)
  (:distnace
   (&optional __distnace)
   (if __distnace (setq _distnace __distnace)) _distnace)
  (:direction
   (&optional __direction)
   (if __direction (setq _direction __direction)) _direction)
  (:serialization-length
   ()
   (+
    ;; float64 _distnace
    8
    ;; float64 _direction
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _distnace
       (sys::poke _distnace (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _direction
       (sys::poke _direction (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _distnace
     (setq _distnace (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _direction
     (setq _direction (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get obstacle_detect::closest_obstacle :md5sum-) "ec51256ac8225594435f3e2203b6dc97")
(setf (get obstacle_detect::closest_obstacle :datatype-) "obstacle_detect/closest_obstacle")
(setf (get obstacle_detect::closest_obstacle :definition-)
      "float64 distnace
float64 direction
")



(provide :obstacle_detect/closest_obstacle "ec51256ac8225594435f3e2203b6dc97")


