// Generated by gencpp from file turtlebot3_object_tracker/detectionRequest.msg
// DO NOT EDIT!


#ifndef TURTLEBOT3_OBJECT_TRACKER_MESSAGE_DETECTIONREQUEST_H
#define TURTLEBOT3_OBJECT_TRACKER_MESSAGE_DETECTIONREQUEST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace turtlebot3_object_tracker
{
template <class ContainerAllocator>
struct detectionRequest_
{
  typedef detectionRequest_<ContainerAllocator> Type;

  detectionRequest_()
    : label()  {
    }
  detectionRequest_(const ContainerAllocator& _alloc)
    : label(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _label_type;
  _label_type label;





  typedef boost::shared_ptr< ::turtlebot3_object_tracker::detectionRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::turtlebot3_object_tracker::detectionRequest_<ContainerAllocator> const> ConstPtr;

}; // struct detectionRequest_

typedef ::turtlebot3_object_tracker::detectionRequest_<std::allocator<void> > detectionRequest;

typedef boost::shared_ptr< ::turtlebot3_object_tracker::detectionRequest > detectionRequestPtr;
typedef boost::shared_ptr< ::turtlebot3_object_tracker::detectionRequest const> detectionRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::turtlebot3_object_tracker::detectionRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::turtlebot3_object_tracker::detectionRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::turtlebot3_object_tracker::detectionRequest_<ContainerAllocator1> & lhs, const ::turtlebot3_object_tracker::detectionRequest_<ContainerAllocator2> & rhs)
{
  return lhs.label == rhs.label;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::turtlebot3_object_tracker::detectionRequest_<ContainerAllocator1> & lhs, const ::turtlebot3_object_tracker::detectionRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace turtlebot3_object_tracker

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::turtlebot3_object_tracker::detectionRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::turtlebot3_object_tracker::detectionRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::turtlebot3_object_tracker::detectionRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::turtlebot3_object_tracker::detectionRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::turtlebot3_object_tracker::detectionRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::turtlebot3_object_tracker::detectionRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::turtlebot3_object_tracker::detectionRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ea23f97416b04c6151d2b576c0665ac1";
  }

  static const char* value(const ::turtlebot3_object_tracker::detectionRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xea23f97416b04c61ULL;
  static const uint64_t static_value2 = 0x51d2b576c0665ac1ULL;
};

template<class ContainerAllocator>
struct DataType< ::turtlebot3_object_tracker::detectionRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "turtlebot3_object_tracker/detectionRequest";
  }

  static const char* value(const ::turtlebot3_object_tracker::detectionRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::turtlebot3_object_tracker::detectionRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string label\n"
;
  }

  static const char* value(const ::turtlebot3_object_tracker::detectionRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::turtlebot3_object_tracker::detectionRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.label);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct detectionRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::turtlebot3_object_tracker::detectionRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::turtlebot3_object_tracker::detectionRequest_<ContainerAllocator>& v)
  {
    s << indent << "label: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.label);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TURTLEBOT3_OBJECT_TRACKER_MESSAGE_DETECTIONREQUEST_H
