// Generated by gencpp from file my_turtle/proximity.msg
// DO NOT EDIT!


#ifndef MY_TURTLE_MESSAGE_PROXIMITY_H
#define MY_TURTLE_MESSAGE_PROXIMITY_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace my_turtle
{
template <class ContainerAllocator>
struct proximity_
{
  typedef proximity_<ContainerAllocator> Type;

  proximity_()
    : up(0)
    , down(0)
    , left(0)
    , right(0)  {
    }
  proximity_(const ContainerAllocator& _alloc)
    : up(0)
    , down(0)
    , left(0)
    , right(0)  {
  (void)_alloc;
    }



   typedef int64_t _up_type;
  _up_type up;

   typedef int64_t _down_type;
  _down_type down;

   typedef int64_t _left_type;
  _left_type left;

   typedef int64_t _right_type;
  _right_type right;





  typedef boost::shared_ptr< ::my_turtle::proximity_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::my_turtle::proximity_<ContainerAllocator> const> ConstPtr;

}; // struct proximity_

typedef ::my_turtle::proximity_<std::allocator<void> > proximity;

typedef boost::shared_ptr< ::my_turtle::proximity > proximityPtr;
typedef boost::shared_ptr< ::my_turtle::proximity const> proximityConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::my_turtle::proximity_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::my_turtle::proximity_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::my_turtle::proximity_<ContainerAllocator1> & lhs, const ::my_turtle::proximity_<ContainerAllocator2> & rhs)
{
  return lhs.up == rhs.up &&
    lhs.down == rhs.down &&
    lhs.left == rhs.left &&
    lhs.right == rhs.right;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::my_turtle::proximity_<ContainerAllocator1> & lhs, const ::my_turtle::proximity_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace my_turtle

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::my_turtle::proximity_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::my_turtle::proximity_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::my_turtle::proximity_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::my_turtle::proximity_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::my_turtle::proximity_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::my_turtle::proximity_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::my_turtle::proximity_<ContainerAllocator> >
{
  static const char* value()
  {
    return "7e422bbe29fec8ddaffc447bd5b0585b";
  }

  static const char* value(const ::my_turtle::proximity_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x7e422bbe29fec8ddULL;
  static const uint64_t static_value2 = 0xaffc447bd5b0585bULL;
};

template<class ContainerAllocator>
struct DataType< ::my_turtle::proximity_<ContainerAllocator> >
{
  static const char* value()
  {
    return "my_turtle/proximity";
  }

  static const char* value(const ::my_turtle::proximity_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::my_turtle::proximity_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int64 up\n"
"int64 down\n"
"int64 left\n"
"int64 right\n"
;
  }

  static const char* value(const ::my_turtle::proximity_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::my_turtle::proximity_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.up);
      stream.next(m.down);
      stream.next(m.left);
      stream.next(m.right);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct proximity_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::my_turtle::proximity_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::my_turtle::proximity_<ContainerAllocator>& v)
  {
    s << indent << "up: ";
    Printer<int64_t>::stream(s, indent + "  ", v.up);
    s << indent << "down: ";
    Printer<int64_t>::stream(s, indent + "  ", v.down);
    s << indent << "left: ";
    Printer<int64_t>::stream(s, indent + "  ", v.left);
    s << indent << "right: ";
    Printer<int64_t>::stream(s, indent + "  ", v.right);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MY_TURTLE_MESSAGE_PROXIMITY_H