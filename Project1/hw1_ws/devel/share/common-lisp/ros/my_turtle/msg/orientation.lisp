; Auto-generated. Do not edit!


(cl:in-package my_turtle-msg)


;//! \htmlinclude orientation.msg.html

(cl:defclass <orientation> (roslisp-msg-protocol:ros-message)
  ((direction
    :reader direction
    :initarg :direction
    :type cl:string
    :initform "")
   (value
    :reader value
    :initarg :value
    :type cl:integer
    :initform 0))
)

(cl:defclass orientation (<orientation>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <orientation>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'orientation)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name my_turtle-msg:<orientation> is deprecated: use my_turtle-msg:orientation instead.")))

(cl:ensure-generic-function 'direction-val :lambda-list '(m))
(cl:defmethod direction-val ((m <orientation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_turtle-msg:direction-val is deprecated.  Use my_turtle-msg:direction instead.")
  (direction m))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <orientation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_turtle-msg:value-val is deprecated.  Use my_turtle-msg:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <orientation>) ostream)
  "Serializes a message object of type '<orientation>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'direction))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'direction))
  (cl:let* ((signed (cl:slot-value msg 'value)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <orientation>) istream)
  "Deserializes a message object of type '<orientation>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'direction) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'direction) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'value) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<orientation>)))
  "Returns string type for a message object of type '<orientation>"
  "my_turtle/orientation")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'orientation)))
  "Returns string type for a message object of type 'orientation"
  "my_turtle/orientation")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<orientation>)))
  "Returns md5sum for a message object of type '<orientation>"
  "77bec05cc26700b375ca23f9f2183c08")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'orientation)))
  "Returns md5sum for a message object of type 'orientation"
  "77bec05cc26700b375ca23f9f2183c08")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<orientation>)))
  "Returns full string definition for message of type '<orientation>"
  (cl:format cl:nil "string direction~%int64 value~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'orientation)))
  "Returns full string definition for message of type 'orientation"
  (cl:format cl:nil "string direction~%int64 value~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <orientation>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'direction))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <orientation>))
  "Converts a ROS message object to a list"
  (cl:list 'orientation
    (cl:cons ':direction (direction msg))
    (cl:cons ':value (value msg))
))
