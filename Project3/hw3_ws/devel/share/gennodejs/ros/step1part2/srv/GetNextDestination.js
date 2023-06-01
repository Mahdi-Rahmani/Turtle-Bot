// Auto-generated. Do not edit!

// (in-package step1part2.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class GetNextDestinationRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.current_x = null;
      this.current_y = null;
    }
    else {
      if (initObj.hasOwnProperty('current_x')) {
        this.current_x = initObj.current_x
      }
      else {
        this.current_x = 0.0;
      }
      if (initObj.hasOwnProperty('current_y')) {
        this.current_y = initObj.current_y
      }
      else {
        this.current_y = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetNextDestinationRequest
    // Serialize message field [current_x]
    bufferOffset = _serializer.float64(obj.current_x, buffer, bufferOffset);
    // Serialize message field [current_y]
    bufferOffset = _serializer.float64(obj.current_y, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetNextDestinationRequest
    let len;
    let data = new GetNextDestinationRequest(null);
    // Deserialize message field [current_x]
    data.current_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [current_y]
    data.current_y = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'step1part2/GetNextDestinationRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '687da78cc91ec402dff4256505312c80';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 current_x
    float64 current_y
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetNextDestinationRequest(null);
    if (msg.current_x !== undefined) {
      resolved.current_x = msg.current_x;
    }
    else {
      resolved.current_x = 0.0
    }

    if (msg.current_y !== undefined) {
      resolved.current_y = msg.current_y;
    }
    else {
      resolved.current_y = 0.0
    }

    return resolved;
    }
};

class GetNextDestinationResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.next_x = null;
      this.next_y = null;
    }
    else {
      if (initObj.hasOwnProperty('next_x')) {
        this.next_x = initObj.next_x
      }
      else {
        this.next_x = 0.0;
      }
      if (initObj.hasOwnProperty('next_y')) {
        this.next_y = initObj.next_y
      }
      else {
        this.next_y = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetNextDestinationResponse
    // Serialize message field [next_x]
    bufferOffset = _serializer.float64(obj.next_x, buffer, bufferOffset);
    // Serialize message field [next_y]
    bufferOffset = _serializer.float64(obj.next_y, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetNextDestinationResponse
    let len;
    let data = new GetNextDestinationResponse(null);
    // Deserialize message field [next_x]
    data.next_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [next_y]
    data.next_y = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'step1part2/GetNextDestinationResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '88bcebe71e245d4153512a784d401c78';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 next_x
    float64 next_y
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetNextDestinationResponse(null);
    if (msg.next_x !== undefined) {
      resolved.next_x = msg.next_x;
    }
    else {
      resolved.next_x = 0.0
    }

    if (msg.next_y !== undefined) {
      resolved.next_y = msg.next_y;
    }
    else {
      resolved.next_y = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: GetNextDestinationRequest,
  Response: GetNextDestinationResponse,
  md5sum() { return '09f8b596f17567f03b1180688311653f'; },
  datatype() { return 'step1part2/GetNextDestination'; }
};
