// Auto-generated. Do not edit!

// (in-package turtlebot3_object_tracker.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class detectionRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.label = null;
    }
    else {
      if (initObj.hasOwnProperty('label')) {
        this.label = initObj.label
      }
      else {
        this.label = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type detectionRequest
    // Serialize message field [label]
    bufferOffset = _serializer.string(obj.label, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type detectionRequest
    let len;
    let data = new detectionRequest(null);
    // Deserialize message field [label]
    data.label = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.label);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'turtlebot3_object_tracker/detectionRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ea23f97416b04c6151d2b576c0665ac1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string label
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new detectionRequest(null);
    if (msg.label !== undefined) {
      resolved.label = msg.label;
    }
    else {
      resolved.label = ''
    }

    return resolved;
    }
};

class detectionResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.xc = null;
      this.yc = null;
      this.width = null;
      this.height = null;
      this.image_x = null;
      this.image_y = null;
    }
    else {
      if (initObj.hasOwnProperty('xc')) {
        this.xc = initObj.xc
      }
      else {
        this.xc = 0.0;
      }
      if (initObj.hasOwnProperty('yc')) {
        this.yc = initObj.yc
      }
      else {
        this.yc = 0.0;
      }
      if (initObj.hasOwnProperty('width')) {
        this.width = initObj.width
      }
      else {
        this.width = 0.0;
      }
      if (initObj.hasOwnProperty('height')) {
        this.height = initObj.height
      }
      else {
        this.height = 0.0;
      }
      if (initObj.hasOwnProperty('image_x')) {
        this.image_x = initObj.image_x
      }
      else {
        this.image_x = 0.0;
      }
      if (initObj.hasOwnProperty('image_y')) {
        this.image_y = initObj.image_y
      }
      else {
        this.image_y = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type detectionResponse
    // Serialize message field [xc]
    bufferOffset = _serializer.float64(obj.xc, buffer, bufferOffset);
    // Serialize message field [yc]
    bufferOffset = _serializer.float64(obj.yc, buffer, bufferOffset);
    // Serialize message field [width]
    bufferOffset = _serializer.float64(obj.width, buffer, bufferOffset);
    // Serialize message field [height]
    bufferOffset = _serializer.float64(obj.height, buffer, bufferOffset);
    // Serialize message field [image_x]
    bufferOffset = _serializer.float64(obj.image_x, buffer, bufferOffset);
    // Serialize message field [image_y]
    bufferOffset = _serializer.float64(obj.image_y, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type detectionResponse
    let len;
    let data = new detectionResponse(null);
    // Deserialize message field [xc]
    data.xc = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [yc]
    data.yc = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [width]
    data.width = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [height]
    data.height = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [image_x]
    data.image_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [image_y]
    data.image_y = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 48;
  }

  static datatype() {
    // Returns string type for a service object
    return 'turtlebot3_object_tracker/detectionResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9e8627ee9d799f957ccbb174713a00fe';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 xc
    float64 yc
    float64 width
    float64 height
    float64 image_x
    float64 image_y
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new detectionResponse(null);
    if (msg.xc !== undefined) {
      resolved.xc = msg.xc;
    }
    else {
      resolved.xc = 0.0
    }

    if (msg.yc !== undefined) {
      resolved.yc = msg.yc;
    }
    else {
      resolved.yc = 0.0
    }

    if (msg.width !== undefined) {
      resolved.width = msg.width;
    }
    else {
      resolved.width = 0.0
    }

    if (msg.height !== undefined) {
      resolved.height = msg.height;
    }
    else {
      resolved.height = 0.0
    }

    if (msg.image_x !== undefined) {
      resolved.image_x = msg.image_x;
    }
    else {
      resolved.image_x = 0.0
    }

    if (msg.image_y !== undefined) {
      resolved.image_y = msg.image_y;
    }
    else {
      resolved.image_y = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: detectionRequest,
  Response: detectionResponse,
  md5sum() { return '192eaad7a30f7ee7738f9a5ce264f551'; },
  datatype() { return 'turtlebot3_object_tracker/detection'; }
};
