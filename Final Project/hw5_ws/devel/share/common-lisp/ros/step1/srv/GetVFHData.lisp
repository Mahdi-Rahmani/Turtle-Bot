; Auto-generated. Do not edit!


(cl:in-package step1-srv)


;//! \htmlinclude GetVFHData-request.msg.html

(cl:defclass <GetVFHData-request> (roslisp-msg-protocol:ros-message)
  ((goal_x
    :reader goal_x
    :initarg :goal_x
    :type cl:float
    :initform 0.0)
   (goal_y
    :reader goal_y
    :initarg :goal_y
    :type cl:float
    :initform 0.0)
   (threshold
    :reader threshold
    :initarg :threshold
    :type cl:float
    :initform 0.0))
)

(cl:defclass GetVFHData-request (<GetVFHData-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetVFHData-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetVFHData-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name step1-srv:<GetVFHData-request> is deprecated: use step1-srv:GetVFHData-request instead.")))

(cl:ensure-generic-function 'goal_x-val :lambda-list '(m))
(cl:defmethod goal_x-val ((m <GetVFHData-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader step1-srv:goal_x-val is deprecated.  Use step1-srv:goal_x instead.")
  (goal_x m))

(cl:ensure-generic-function 'goal_y-val :lambda-list '(m))
(cl:defmethod goal_y-val ((m <GetVFHData-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader step1-srv:goal_y-val is deprecated.  Use step1-srv:goal_y instead.")
  (goal_y m))

(cl:ensure-generic-function 'threshold-val :lambda-list '(m))
(cl:defmethod threshold-val ((m <GetVFHData-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader step1-srv:threshold-val is deprecated.  Use step1-srv:threshold instead.")
  (threshold m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetVFHData-request>) ostream)
  "Serializes a message object of type '<GetVFHData-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'goal_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'goal_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'threshold))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetVFHData-request>) istream)
  "Deserializes a message object of type '<GetVFHData-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'goal_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'goal_y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'threshold) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetVFHData-request>)))
  "Returns string type for a service object of type '<GetVFHData-request>"
  "step1/GetVFHDataRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetVFHData-request)))
  "Returns string type for a service object of type 'GetVFHData-request"
  "step1/GetVFHDataRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetVFHData-request>)))
  "Returns md5sum for a message object of type '<GetVFHData-request>"
  "7afd2a141a3ca51e86f2fbc885cf9fc7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetVFHData-request)))
  "Returns md5sum for a message object of type 'GetVFHData-request"
  "7afd2a141a3ca51e86f2fbc885cf9fc7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetVFHData-request>)))
  "Returns full string definition for message of type '<GetVFHData-request>"
  (cl:format cl:nil "float64 goal_x~%float64 goal_y~%float64 threshold~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetVFHData-request)))
  "Returns full string definition for message of type 'GetVFHData-request"
  (cl:format cl:nil "float64 goal_x~%float64 goal_y~%float64 threshold~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetVFHData-request>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetVFHData-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetVFHData-request
    (cl:cons ':goal_x (goal_x msg))
    (cl:cons ':goal_y (goal_y msg))
    (cl:cons ':threshold (threshold msg))
))
;//! \htmlinclude GetVFHData-response.msg.html

(cl:defclass <GetVFHData-response> (roslisp-msg-protocol:ros-message)
  ((desired_angle
    :reader desired_angle
    :initarg :desired_angle
    :type cl:float
    :initform 0.0)
   (h_prim_c
    :reader h_prim_c
    :initarg :h_prim_c
    :type cl:float
    :initform 0.0))
)

(cl:defclass GetVFHData-response (<GetVFHData-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetVFHData-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetVFHData-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name step1-srv:<GetVFHData-response> is deprecated: use step1-srv:GetVFHData-response instead.")))

(cl:ensure-generic-function 'desired_angle-val :lambda-list '(m))
(cl:defmethod desired_angle-val ((m <GetVFHData-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader step1-srv:desired_angle-val is deprecated.  Use step1-srv:desired_angle instead.")
  (desired_angle m))

(cl:ensure-generic-function 'h_prim_c-val :lambda-list '(m))
(cl:defmethod h_prim_c-val ((m <GetVFHData-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader step1-srv:h_prim_c-val is deprecated.  Use step1-srv:h_prim_c instead.")
  (h_prim_c m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetVFHData-response>) ostream)
  "Serializes a message object of type '<GetVFHData-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'desired_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'h_prim_c))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetVFHData-response>) istream)
  "Deserializes a message object of type '<GetVFHData-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'desired_angle) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'h_prim_c) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetVFHData-response>)))
  "Returns string type for a service object of type '<GetVFHData-response>"
  "step1/GetVFHDataResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetVFHData-response)))
  "Returns string type for a service object of type 'GetVFHData-response"
  "step1/GetVFHDataResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetVFHData-response>)))
  "Returns md5sum for a message object of type '<GetVFHData-response>"
  "7afd2a141a3ca51e86f2fbc885cf9fc7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetVFHData-response)))
  "Returns md5sum for a message object of type 'GetVFHData-response"
  "7afd2a141a3ca51e86f2fbc885cf9fc7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetVFHData-response>)))
  "Returns full string definition for message of type '<GetVFHData-response>"
  (cl:format cl:nil "float64 desired_angle~%float64 h_prim_c~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetVFHData-response)))
  "Returns full string definition for message of type 'GetVFHData-response"
  (cl:format cl:nil "float64 desired_angle~%float64 h_prim_c~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetVFHData-response>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetVFHData-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetVFHData-response
    (cl:cons ':desired_angle (desired_angle msg))
    (cl:cons ':h_prim_c (h_prim_c msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetVFHData)))
  'GetVFHData-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetVFHData)))
  'GetVFHData-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetVFHData)))
  "Returns string type for a service object of type '<GetVFHData>"
  "step1/GetVFHData")