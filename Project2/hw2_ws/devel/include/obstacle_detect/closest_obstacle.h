// Generated by gencpp from file obstacle_detect/closest_obstacle.msg
// DO NOT EDIT!


#ifndef OBSTACLE_DETECT_MESSAGE_CLOSEST_OBSTACLE_H
#define OBSTACLE_DETECT_MESSAGE_CLOSEST_OBSTACLE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace obstacle_detect
{
template <class ContainerAllocator>
struct closest_obstacle_
{
  typedef closest_obstacle_<ContainerAllocator> Type;

  closest_obstacle_()
    : distnace(0.0)
    , direction(0.0)  {
    }
  closest_obstacle_(const ContainerAllocator& _alloc)
    : distnace(0.0)
    , direction(0.0)  {
  (void)_alloc;
    }



   typedef double _distnace_type;
  _distnace_type distnace;

   typedef double _direction_type;
  _direction_type direction;





  typedef boost::shared_ptr< ::obstacle_detect::closest_obstacle_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::obstacle_detect::closest_obstacle_<ContainerAllocator> const> ConstPtr;

}; // struct closest_obstacle_

typedef ::obstacle_detect::closest_obstacle_<std::allocator<void> > closest_obstacle;

typedef boost::shared_ptr< ::obstacle_detect::closest_obstacle > closest_obstaclePtr;
typedef boost::shared_ptr< ::obstacle_detect::closest_obstacle const> closest_obstacleConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::obstacle_detect::closest_obstacle_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::obstacle_detect::closest_obstacle_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::obstacle_detect::closest_obstacle_<ContainerAllocator1> & lhs, const ::obstacle_detect::closest_obstacle_<ContainerAllocator2> & rhs)
{
  return lhs.distnace == rhs.distnace &&
    lhs.direction == rhs.direction;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::obstacle_detect::closest_obstacle_<ContainerAllocator1> & lhs, const ::obstacle_detect::closest_obstacle_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace obstacle_detect

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::obstacle_detect::closest_obstacle_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::obstacle_detect::closest_obstacle_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::obstacle_detect::closest_obstacle_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::obstacle_detect::closest_obstacle_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::obstacle_detect::closest_obstacle_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::obstacle_detect::closest_obstacle_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::obstacle_detect::closest_obstacle_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ec51256ac8225594435f3e2203b6dc97";
  }

  static const char* value(const ::obstacle_detect::closest_obstacle_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xec51256ac8225594ULL;
  static const uint64_t static_value2 = 0x435f3e2203b6dc97ULL;
};

template<class ContainerAllocator>
struct DataType< ::obstacle_detect::closest_obstacle_<ContainerAllocator> >
{
  static const char* value()
  {
    return "obstacle_detect/closest_obstacle";
  }

  static const char* value(const ::obstacle_detect::closest_obstacle_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::obstacle_detect::closest_obstacle_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 distnace\n"
"float64 direction\n"
;
  }

  static const char* value(const ::obstacle_detect::closest_obstacle_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::obstacle_detect::closest_obstacle_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.distnace);
      stream.next(m.direction);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct closest_obstacle_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::obstacle_detect::closest_obstacle_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::obstacle_detect::closest_obstacle_<ContainerAllocator>& v)
  {
    s << indent << "distnace: ";
    Printer<double>::stream(s, indent + "  ", v.distnace);
    s << indent << "direction: ";
    Printer<double>::stream(s, indent + "  ", v.direction);
  }
};

} // namespace message_operations
} // namespace ros

#endif // OBSTACLE_DETECT_MESSAGE_CLOSEST_OBSTACLE_H