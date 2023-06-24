// Generated by gencpp from file turtlebot3_object_tracker/detection.msg
// DO NOT EDIT!


#ifndef TURTLEBOT3_OBJECT_TRACKER_MESSAGE_DETECTION_H
#define TURTLEBOT3_OBJECT_TRACKER_MESSAGE_DETECTION_H

#include <ros/service_traits.h>


#include <turtlebot3_object_tracker/detectionRequest.h>
#include <turtlebot3_object_tracker/detectionResponse.h>


namespace turtlebot3_object_tracker
{

struct detection
{

typedef detectionRequest Request;
typedef detectionResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct detection
} // namespace turtlebot3_object_tracker


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::turtlebot3_object_tracker::detection > {
  static const char* value()
  {
    return "192eaad7a30f7ee7738f9a5ce264f551";
  }

  static const char* value(const ::turtlebot3_object_tracker::detection&) { return value(); }
};

template<>
struct DataType< ::turtlebot3_object_tracker::detection > {
  static const char* value()
  {
    return "turtlebot3_object_tracker/detection";
  }

  static const char* value(const ::turtlebot3_object_tracker::detection&) { return value(); }
};


// service_traits::MD5Sum< ::turtlebot3_object_tracker::detectionRequest> should match
// service_traits::MD5Sum< ::turtlebot3_object_tracker::detection >
template<>
struct MD5Sum< ::turtlebot3_object_tracker::detectionRequest>
{
  static const char* value()
  {
    return MD5Sum< ::turtlebot3_object_tracker::detection >::value();
  }
  static const char* value(const ::turtlebot3_object_tracker::detectionRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::turtlebot3_object_tracker::detectionRequest> should match
// service_traits::DataType< ::turtlebot3_object_tracker::detection >
template<>
struct DataType< ::turtlebot3_object_tracker::detectionRequest>
{
  static const char* value()
  {
    return DataType< ::turtlebot3_object_tracker::detection >::value();
  }
  static const char* value(const ::turtlebot3_object_tracker::detectionRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::turtlebot3_object_tracker::detectionResponse> should match
// service_traits::MD5Sum< ::turtlebot3_object_tracker::detection >
template<>
struct MD5Sum< ::turtlebot3_object_tracker::detectionResponse>
{
  static const char* value()
  {
    return MD5Sum< ::turtlebot3_object_tracker::detection >::value();
  }
  static const char* value(const ::turtlebot3_object_tracker::detectionResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::turtlebot3_object_tracker::detectionResponse> should match
// service_traits::DataType< ::turtlebot3_object_tracker::detection >
template<>
struct DataType< ::turtlebot3_object_tracker::detectionResponse>
{
  static const char* value()
  {
    return DataType< ::turtlebot3_object_tracker::detection >::value();
  }
  static const char* value(const ::turtlebot3_object_tracker::detectionResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // TURTLEBOT3_OBJECT_TRACKER_MESSAGE_DETECTION_H
