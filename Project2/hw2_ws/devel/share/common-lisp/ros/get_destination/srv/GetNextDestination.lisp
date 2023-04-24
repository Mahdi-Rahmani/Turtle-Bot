; Auto-generated. Do not edit!


(cl:in-package get_destination-srv)


;//! \htmlinclude GetNextDestination-request.msg.html

(cl:defclass <GetNextDestination-request> (roslisp-msg-protocol:ros-message)
  ((current_x
    :reader current_x
    :initarg :current_x
    :type cl:float
    :initform 0.0)
   (current_y
    :reader current_y
    :initarg :current_y
    :type cl:float
    :initform 0.0))
)

(cl:defclass GetNextDestination-request (<GetNextDestination-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetNextDestination-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetNextDestination-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name get_destination-srv:<GetNextDestination-request> is deprecated: use get_destination-srv:GetNextDestination-request instead.")))

(cl:ensure-generic-function 'current_x-val :lambda-list '(m))
(cl:defmethod current_x-val ((m <GetNextDestination-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader get_destination-srv:current_x-val is deprecated.  Use get_destination-srv:current_x instead.")
  (current_x m))

(cl:ensure-generic-function 'current_y-val :lambda-list '(m))
(cl:defmethod current_y-val ((m <GetNextDestination-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader get_destination-srv:current_y-val is deprecated.  Use get_destination-srv:current_y instead.")
  (current_y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetNextDestination-request>) ostream)
  "Serializes a message object of type '<GetNextDestination-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'current_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'current_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetNextDestination-request>) istream)
  "Deserializes a message object of type '<GetNextDestination-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'current_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'current_y) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetNextDestination-request>)))
  "Returns string type for a service object of type '<GetNextDestination-request>"
  "get_destination/GetNextDestinationRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetNextDestination-request)))
  "Returns string type for a service object of type 'GetNextDestination-request"
  "get_destination/GetNextDestinationRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetNextDestination-request>)))
  "Returns md5sum for a message object of type '<GetNextDestination-request>"
  "09f8b596f17567f03b1180688311653f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetNextDestination-request)))
  "Returns md5sum for a message object of type 'GetNextDestination-request"
  "09f8b596f17567f03b1180688311653f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetNextDestination-request>)))
  "Returns full string definition for message of type '<GetNextDestination-request>"
  (cl:format cl:nil "float64 current_x~%float64 current_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetNextDestination-request)))
  "Returns full string definition for message of type 'GetNextDestination-request"
  (cl:format cl:nil "float64 current_x~%float64 current_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetNextDestination-request>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetNextDestination-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetNextDestination-request
    (cl:cons ':current_x (current_x msg))
    (cl:cons ':current_y (current_y msg))
))
;//! \htmlinclude GetNextDestination-response.msg.html

(cl:defclass <GetNextDestination-response> (roslisp-msg-protocol:ros-message)
  ((next_x
    :reader next_x
    :initarg :next_x
    :type cl:float
    :initform 0.0)
   (next_y
    :reader next_y
    :initarg :next_y
    :type cl:float
    :initform 0.0))
)

(cl:defclass GetNextDestination-response (<GetNextDestination-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetNextDestination-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetNextDestination-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name get_destination-srv:<GetNextDestination-response> is deprecated: use get_destination-srv:GetNextDestination-response instead.")))

(cl:ensure-generic-function 'next_x-val :lambda-list '(m))
(cl:defmethod next_x-val ((m <GetNextDestination-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader get_destination-srv:next_x-val is deprecated.  Use get_destination-srv:next_x instead.")
  (next_x m))

(cl:ensure-generic-function 'next_y-val :lambda-list '(m))
(cl:defmethod next_y-val ((m <GetNextDestination-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader get_destination-srv:next_y-val is deprecated.  Use get_destination-srv:next_y instead.")
  (next_y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetNextDestination-response>) ostream)
  "Serializes a message object of type '<GetNextDestination-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'next_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'next_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetNextDestination-response>) istream)
  "Deserializes a message object of type '<GetNextDestination-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'next_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'next_y) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetNextDestination-response>)))
  "Returns string type for a service object of type '<GetNextDestination-response>"
  "get_destination/GetNextDestinationResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetNextDestination-response)))
  "Returns string type for a service object of type 'GetNextDestination-response"
  "get_destination/GetNextDestinationResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetNextDestination-response>)))
  "Returns md5sum for a message object of type '<GetNextDestination-response>"
  "09f8b596f17567f03b1180688311653f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetNextDestination-response)))
  "Returns md5sum for a message object of type 'GetNextDestination-response"
  "09f8b596f17567f03b1180688311653f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetNextDestination-response>)))
  "Returns full string definition for message of type '<GetNextDestination-response>"
  (cl:format cl:nil "float64 next_x~%float64 next_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetNextDestination-response)))
  "Returns full string definition for message of type 'GetNextDestination-response"
  (cl:format cl:nil "float64 next_x~%float64 next_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetNextDestination-response>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetNextDestination-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetNextDestination-response
    (cl:cons ':next_x (next_x msg))
    (cl:cons ':next_y (next_y msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetNextDestination)))
  'GetNextDestination-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetNextDestination)))
  'GetNextDestination-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetNextDestination)))
  "Returns string type for a service object of type '<GetNextDestination>"
  "get_destination/GetNextDestination")