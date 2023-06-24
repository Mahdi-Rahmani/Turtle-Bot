# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "turtlebot3_object_tracker: 0 messages, 1 services")

set(MSG_I_FLAGS "-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(turtlebot3_object_tracker_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/mahdi/Desktop/Robotics/project4/hw4_ws/src/turtlebot3_object_tracker/srv/detection.srv" NAME_WE)
add_custom_target(_turtlebot3_object_tracker_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "turtlebot3_object_tracker" "/home/mahdi/Desktop/Robotics/project4/hw4_ws/src/turtlebot3_object_tracker/srv/detection.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(turtlebot3_object_tracker
  "/home/mahdi/Desktop/Robotics/project4/hw4_ws/src/turtlebot3_object_tracker/srv/detection.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtlebot3_object_tracker
)

### Generating Module File
_generate_module_cpp(turtlebot3_object_tracker
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtlebot3_object_tracker
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(turtlebot3_object_tracker_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(turtlebot3_object_tracker_generate_messages turtlebot3_object_tracker_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mahdi/Desktop/Robotics/project4/hw4_ws/src/turtlebot3_object_tracker/srv/detection.srv" NAME_WE)
add_dependencies(turtlebot3_object_tracker_generate_messages_cpp _turtlebot3_object_tracker_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(turtlebot3_object_tracker_gencpp)
add_dependencies(turtlebot3_object_tracker_gencpp turtlebot3_object_tracker_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS turtlebot3_object_tracker_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(turtlebot3_object_tracker
  "/home/mahdi/Desktop/Robotics/project4/hw4_ws/src/turtlebot3_object_tracker/srv/detection.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtlebot3_object_tracker
)

### Generating Module File
_generate_module_eus(turtlebot3_object_tracker
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtlebot3_object_tracker
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(turtlebot3_object_tracker_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(turtlebot3_object_tracker_generate_messages turtlebot3_object_tracker_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mahdi/Desktop/Robotics/project4/hw4_ws/src/turtlebot3_object_tracker/srv/detection.srv" NAME_WE)
add_dependencies(turtlebot3_object_tracker_generate_messages_eus _turtlebot3_object_tracker_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(turtlebot3_object_tracker_geneus)
add_dependencies(turtlebot3_object_tracker_geneus turtlebot3_object_tracker_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS turtlebot3_object_tracker_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(turtlebot3_object_tracker
  "/home/mahdi/Desktop/Robotics/project4/hw4_ws/src/turtlebot3_object_tracker/srv/detection.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtlebot3_object_tracker
)

### Generating Module File
_generate_module_lisp(turtlebot3_object_tracker
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtlebot3_object_tracker
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(turtlebot3_object_tracker_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(turtlebot3_object_tracker_generate_messages turtlebot3_object_tracker_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mahdi/Desktop/Robotics/project4/hw4_ws/src/turtlebot3_object_tracker/srv/detection.srv" NAME_WE)
add_dependencies(turtlebot3_object_tracker_generate_messages_lisp _turtlebot3_object_tracker_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(turtlebot3_object_tracker_genlisp)
add_dependencies(turtlebot3_object_tracker_genlisp turtlebot3_object_tracker_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS turtlebot3_object_tracker_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(turtlebot3_object_tracker
  "/home/mahdi/Desktop/Robotics/project4/hw4_ws/src/turtlebot3_object_tracker/srv/detection.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtlebot3_object_tracker
)

### Generating Module File
_generate_module_nodejs(turtlebot3_object_tracker
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtlebot3_object_tracker
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(turtlebot3_object_tracker_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(turtlebot3_object_tracker_generate_messages turtlebot3_object_tracker_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mahdi/Desktop/Robotics/project4/hw4_ws/src/turtlebot3_object_tracker/srv/detection.srv" NAME_WE)
add_dependencies(turtlebot3_object_tracker_generate_messages_nodejs _turtlebot3_object_tracker_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(turtlebot3_object_tracker_gennodejs)
add_dependencies(turtlebot3_object_tracker_gennodejs turtlebot3_object_tracker_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS turtlebot3_object_tracker_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(turtlebot3_object_tracker
  "/home/mahdi/Desktop/Robotics/project4/hw4_ws/src/turtlebot3_object_tracker/srv/detection.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtlebot3_object_tracker
)

### Generating Module File
_generate_module_py(turtlebot3_object_tracker
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtlebot3_object_tracker
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(turtlebot3_object_tracker_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(turtlebot3_object_tracker_generate_messages turtlebot3_object_tracker_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mahdi/Desktop/Robotics/project4/hw4_ws/src/turtlebot3_object_tracker/srv/detection.srv" NAME_WE)
add_dependencies(turtlebot3_object_tracker_generate_messages_py _turtlebot3_object_tracker_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(turtlebot3_object_tracker_genpy)
add_dependencies(turtlebot3_object_tracker_genpy turtlebot3_object_tracker_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS turtlebot3_object_tracker_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtlebot3_object_tracker)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtlebot3_object_tracker
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(turtlebot3_object_tracker_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(turtlebot3_object_tracker_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtlebot3_object_tracker)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtlebot3_object_tracker
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(turtlebot3_object_tracker_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(turtlebot3_object_tracker_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtlebot3_object_tracker)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtlebot3_object_tracker
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(turtlebot3_object_tracker_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(turtlebot3_object_tracker_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtlebot3_object_tracker)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtlebot3_object_tracker
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(turtlebot3_object_tracker_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(turtlebot3_object_tracker_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtlebot3_object_tracker)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtlebot3_object_tracker\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtlebot3_object_tracker
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(turtlebot3_object_tracker_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(turtlebot3_object_tracker_generate_messages_py sensor_msgs_generate_messages_py)
endif()
