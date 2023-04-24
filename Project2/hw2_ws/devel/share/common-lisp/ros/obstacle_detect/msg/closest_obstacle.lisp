; Auto-generated. Do not edit!


(cl:in-package obstacle_detect-msg)


;//! \htmlinclude closest_obstacle.msg.html

(cl:defclass <closest_obstacle> (roslisp-msg-protocol:ros-message)
  ((distnace
    :reader distnace
    :initarg :distnace
    :type cl:float
    :initform 0.0)
   (direction
    :reader direction
    :initarg :direction
    :type cl:float
    :initform 0.0))
)

(cl:defclass closest_obstacle (<closest_obstacle>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <closest_obstacle>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'closest_obstacle)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name obstacle_detect-msg:<closest_obstacle> is deprecated: use obstacle_detect-msg:closest_obstacle instead.")))

(cl:ensure-generic-function 'distnace-val :lambda-list '(m))
(cl:defmethod distnace-val ((m <closest_obstacle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader obstacle_detect-msg:distnace-val is deprecated.  Use obstacle_detect-msg:distnace instead.")
  (distnace m))

(cl:ensure-generic-function 'direction-val :lambda-list '(m))
(cl:defmethod direction-val ((m <closest_obstacle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader obstacle_detect-msg:direction-val is deprecated.  Use obstacle_detect-msg:direction instead.")
  (direction m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <closest_obstacle>) ostream)
  "Serializes a message object of type '<closest_obstacle>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'distnace))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'direction))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <closest_obstacle>) istream)
  "Deserializes a message object of type '<closest_obstacle>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distnace) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'direction) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<closest_obstacle>)))
  "Returns string type for a message object of type '<closest_obstacle>"
  "obstacle_detect/closest_obstacle")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'closest_obstacle)))
  "Returns string type for a message object of type 'closest_obstacle"
  "obstacle_detect/closest_obstacle")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<closest_obstacle>)))
  "Returns md5sum for a message object of type '<closest_obstacle>"
  "ec51256ac8225594435f3e2203b6dc97")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'closest_obstacle)))
  "Returns md5sum for a message object of type 'closest_obstacle"
  "ec51256ac8225594435f3e2203b6dc97")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<closest_obstacle>)))
  "Returns full string definition for message of type '<closest_obstacle>"
  (cl:format cl:nil "float64 distnace~%float64 direction~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'closest_obstacle)))
  "Returns full string definition for message of type 'closest_obstacle"
  (cl:format cl:nil "float64 distnace~%float64 direction~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <closest_obstacle>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <closest_obstacle>))
  "Converts a ROS message object to a list"
  (cl:list 'closest_obstacle
    (cl:cons ':distnace (distnace msg))
    (cl:cons ':direction (direction msg))
))
