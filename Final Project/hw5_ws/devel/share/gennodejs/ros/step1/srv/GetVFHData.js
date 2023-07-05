// Auto-generated. Do not edit!

// (in-package step1.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class GetVFHDataRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.goal_x = null;
      this.goal_y = null;
      this.threshold = null;
    }
    else {
      if (initObj.hasOwnProperty('goal_x')) {
        this.goal_x = initObj.goal_x
      }
      else {
        this.goal_x = 0.0;
      }
      if (initObj.hasOwnProperty('goal_y')) {
        this.goal_y = initObj.goal_y
      }
      else {
        this.goal_y = 0.0;
      }
      if (initObj.hasOwnProperty('threshold')) {
        this.threshold = initObj.threshold
      }
      else {
        this.threshold = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetVFHDataRequest
    // Serialize message field [goal_x]
    bufferOffset = _serializer.float64(obj.goal_x, buffer, bufferOffset);
    // Serialize message field [goal_y]
    bufferOffset = _serializer.float64(obj.goal_y, buffer, bufferOffset);
    // Serialize message field [threshold]
    bufferOffset = _serializer.float64(obj.threshold, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetVFHDataRequest
    let len;
    let data = new GetVFHDataRequest(null);
    // Deserialize message field [goal_x]
    data.goal_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [goal_y]
    data.goal_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [threshold]
    data.threshold = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a service object
    return 'step1/GetVFHDataRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fc63d46a0c19a3513335e12ec0019002';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 goal_x
    float64 goal_y
    float64 threshold
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetVFHDataRequest(null);
    if (msg.goal_x !== undefined) {
      resolved.goal_x = msg.goal_x;
    }
    else {
      resolved.goal_x = 0.0
    }

    if (msg.goal_y !== undefined) {
      resolved.goal_y = msg.goal_y;
    }
    else {
      resolved.goal_y = 0.0
    }

    if (msg.threshold !== undefined) {
      resolved.threshold = msg.threshold;
    }
    else {
      resolved.threshold = 0.0
    }

    return resolved;
    }
};

class GetVFHDataResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.desired_angle = null;
      this.h_prim_c = null;
    }
    else {
      if (initObj.hasOwnProperty('desired_angle')) {
        this.desired_angle = initObj.desired_angle
      }
      else {
        this.desired_angle = 0.0;
      }
      if (initObj.hasOwnProperty('h_prim_c')) {
        this.h_prim_c = initObj.h_prim_c
      }
      else {
        this.h_prim_c = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetVFHDataResponse
    // Serialize message field [desired_angle]
    bufferOffset = _serializer.float64(obj.desired_angle, buffer, bufferOffset);
    // Serialize message field [h_prim_c]
    bufferOffset = _serializer.float64(obj.h_prim_c, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetVFHDataResponse
    let len;
    let data = new GetVFHDataResponse(null);
    // Deserialize message field [desired_angle]
    data.desired_angle = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [h_prim_c]
    data.h_prim_c = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'step1/GetVFHDataResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e3b9ed196b65d1013a3533ff01d9a282';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 desired_angle
    float64 h_prim_c
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetVFHDataResponse(null);
    if (msg.desired_angle !== undefined) {
      resolved.desired_angle = msg.desired_angle;
    }
    else {
      resolved.desired_angle = 0.0
    }

    if (msg.h_prim_c !== undefined) {
      resolved.h_prim_c = msg.h_prim_c;
    }
    else {
      resolved.h_prim_c = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: GetVFHDataRequest,
  Response: GetVFHDataResponse,
  md5sum() { return '7afd2a141a3ca51e86f2fbc885cf9fc7'; },
  datatype() { return 'step1/GetVFHData'; }
};
