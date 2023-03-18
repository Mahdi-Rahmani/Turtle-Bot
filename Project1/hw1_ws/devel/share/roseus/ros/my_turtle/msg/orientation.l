;; Auto-generated. Do not edit!


(when (boundp 'my_turtle::orientation)
  (if (not (find-package "MY_TURTLE"))
    (make-package "MY_TURTLE"))
  (shadow 'orientation (find-package "MY_TURTLE")))
(unless (find-package "MY_TURTLE::ORIENTATION")
  (make-package "MY_TURTLE::ORIENTATION"))

(in-package "ROS")
;;//! \htmlinclude orientation.msg.html


(defclass my_turtle::orientation
  :super ros::object
  :slots (_direction _value ))

(defmethod my_turtle::orientation
  (:init
   (&key
    ((:direction __direction) "")
    ((:value __value) 0)
    )
   (send-super :init)
   (setq _direction (string __direction))
   (setq _value (round __value))
   self)
  (:direction
   (&optional __direction)
   (if __direction (setq _direction __direction)) _direction)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:serialization-length
   ()
   (+
    ;; string _direction
    4 (length _direction)
    ;; int64 _value
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _direction
       (write-long (length _direction) s) (princ _direction s)
     ;; int64 _value
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _value (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _value) (= (length (_value . bv)) 2)) ;; bignum
              (write-long (ash (elt (_value . bv) 0) 0) s)
              (write-long (ash (elt (_value . bv) 1) -1) s))
             ((and (class _value) (= (length (_value . bv)) 1)) ;; big1
              (write-long (elt (_value . bv) 0) s)
              (write-long (if (>= _value 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _value s)(write-long (if (>= _value 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _direction
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _direction (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int64 _value
#+(or :alpha :irix6 :x86_64)
      (setf _value (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _value (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(setf (get my_turtle::orientation :md5sum-) "77bec05cc26700b375ca23f9f2183c08")
(setf (get my_turtle::orientation :datatype-) "my_turtle/orientation")
(setf (get my_turtle::orientation :definition-)
      "string direction
int64 value
")



(provide :my_turtle/orientation "77bec05cc26700b375ca23f9f2183c08")


