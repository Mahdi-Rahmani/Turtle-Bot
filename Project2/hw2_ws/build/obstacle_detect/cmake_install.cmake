# Install script for directory: /home/mahdi/Desktop/Robotics/project2/HW2_9731701/packages/hw2_ws/src/obstacle_detect

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/mahdi/Desktop/Robotics/project2/HW2_9731701/packages/hw2_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/obstacle_detect/msg" TYPE FILE FILES "/home/mahdi/Desktop/Robotics/project2/HW2_9731701/packages/hw2_ws/src/obstacle_detect/msg/closest_obstacle.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/obstacle_detect/cmake" TYPE FILE FILES "/home/mahdi/Desktop/Robotics/project2/HW2_9731701/packages/hw2_ws/build/obstacle_detect/catkin_generated/installspace/obstacle_detect-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/mahdi/Desktop/Robotics/project2/HW2_9731701/packages/hw2_ws/devel/include/obstacle_detect")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/mahdi/Desktop/Robotics/project2/HW2_9731701/packages/hw2_ws/devel/share/roseus/ros/obstacle_detect")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/mahdi/Desktop/Robotics/project2/HW2_9731701/packages/hw2_ws/devel/share/common-lisp/ros/obstacle_detect")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/mahdi/Desktop/Robotics/project2/HW2_9731701/packages/hw2_ws/devel/share/gennodejs/ros/obstacle_detect")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/mahdi/Desktop/Robotics/project2/HW2_9731701/packages/hw2_ws/devel/lib/python3/dist-packages/obstacle_detect")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/mahdi/Desktop/Robotics/project2/HW2_9731701/packages/hw2_ws/devel/lib/python3/dist-packages/obstacle_detect")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/mahdi/Desktop/Robotics/project2/HW2_9731701/packages/hw2_ws/build/obstacle_detect/catkin_generated/installspace/obstacle_detect.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/obstacle_detect/cmake" TYPE FILE FILES "/home/mahdi/Desktop/Robotics/project2/HW2_9731701/packages/hw2_ws/build/obstacle_detect/catkin_generated/installspace/obstacle_detect-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/obstacle_detect/cmake" TYPE FILE FILES
    "/home/mahdi/Desktop/Robotics/project2/HW2_9731701/packages/hw2_ws/build/obstacle_detect/catkin_generated/installspace/obstacle_detectConfig.cmake"
    "/home/mahdi/Desktop/Robotics/project2/HW2_9731701/packages/hw2_ws/build/obstacle_detect/catkin_generated/installspace/obstacle_detectConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/obstacle_detect" TYPE FILE FILES "/home/mahdi/Desktop/Robotics/project2/HW2_9731701/packages/hw2_ws/src/obstacle_detect/package.xml")
endif()

