# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "get_destination: 0 messages, 1 services")

set(MSG_I_FLAGS "-Inav_msgs:/opt/ros/noetic/share/nav_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/noetic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(get_destination_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/mahdi/Desktop/Robotics/project2/HW2_9731701/packages/hw2_ws/src/get_destination/srv/GetNextDestination.srv" NAME_WE)
add_custom_target(_get_destination_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "get_destination" "/home/mahdi/Desktop/Robotics/project2/HW2_9731701/packages/hw2_ws/src/get_destination/srv/GetNextDestination.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(get_destination
  "/home/mahdi/Desktop/Robotics/project2/HW2_9731701/packages/hw2_ws/src/get_destination/srv/GetNextDestination.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/get_destination
)

### Generating Module File
_generate_module_cpp(get_destination
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/get_destination
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(get_destination_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(get_destination_generate_messages get_destination_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mahdi/Desktop/Robotics/project2/HW2_9731701/packages/hw2_ws/src/get_destination/srv/GetNextDestination.srv" NAME_WE)
add_dependencies(get_destination_generate_messages_cpp _get_destination_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(get_destination_gencpp)
add_dependencies(get_destination_gencpp get_destination_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS get_destination_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(get_destination
  "/home/mahdi/Desktop/Robotics/project2/HW2_9731701/packages/hw2_ws/src/get_destination/srv/GetNextDestination.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/get_destination
)

### Generating Module File
_generate_module_eus(get_destination
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/get_destination
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(get_destination_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(get_destination_generate_messages get_destination_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mahdi/Desktop/Robotics/project2/HW2_9731701/packages/hw2_ws/src/get_destination/srv/GetNextDestination.srv" NAME_WE)
add_dependencies(get_destination_generate_messages_eus _get_destination_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(get_destination_geneus)
add_dependencies(get_destination_geneus get_destination_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS get_destination_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(get_destination
  "/home/mahdi/Desktop/Robotics/project2/HW2_9731701/packages/hw2_ws/src/get_destination/srv/GetNextDestination.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/get_destination
)

### Generating Module File
_generate_module_lisp(get_destination
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/get_destination
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(get_destination_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(get_destination_generate_messages get_destination_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mahdi/Desktop/Robotics/project2/HW2_9731701/packages/hw2_ws/src/get_destination/srv/GetNextDestination.srv" NAME_WE)
add_dependencies(get_destination_generate_messages_lisp _get_destination_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(get_destination_genlisp)
add_dependencies(get_destination_genlisp get_destination_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS get_destination_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(get_destination
  "/home/mahdi/Desktop/Robotics/project2/HW2_9731701/packages/hw2_ws/src/get_destination/srv/GetNextDestination.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/get_destination
)

### Generating Module File
_generate_module_nodejs(get_destination
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/get_destination
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(get_destination_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(get_destination_generate_messages get_destination_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mahdi/Desktop/Robotics/project2/HW2_9731701/packages/hw2_ws/src/get_destination/srv/GetNextDestination.srv" NAME_WE)
add_dependencies(get_destination_generate_messages_nodejs _get_destination_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(get_destination_gennodejs)
add_dependencies(get_destination_gennodejs get_destination_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS get_destination_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(get_destination
  "/home/mahdi/Desktop/Robotics/project2/HW2_9731701/packages/hw2_ws/src/get_destination/srv/GetNextDestination.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/get_destination
)

### Generating Module File
_generate_module_py(get_destination
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/get_destination
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(get_destination_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(get_destination_generate_messages get_destination_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mahdi/Desktop/Robotics/project2/HW2_9731701/packages/hw2_ws/src/get_destination/srv/GetNextDestination.srv" NAME_WE)
add_dependencies(get_destination_generate_messages_py _get_destination_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(get_destination_genpy)
add_dependencies(get_destination_genpy get_destination_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS get_destination_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/get_destination)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/get_destination
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET nav_msgs_generate_messages_cpp)
  add_dependencies(get_destination_generate_messages_cpp nav_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/get_destination)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/get_destination
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET nav_msgs_generate_messages_eus)
  add_dependencies(get_destination_generate_messages_eus nav_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/get_destination)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/get_destination
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET nav_msgs_generate_messages_lisp)
  add_dependencies(get_destination_generate_messages_lisp nav_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/get_destination)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/get_destination
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET nav_msgs_generate_messages_nodejs)
  add_dependencies(get_destination_generate_messages_nodejs nav_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/get_destination)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/get_destination\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/get_destination
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET nav_msgs_generate_messages_py)
  add_dependencies(get_destination_generate_messages_py nav_msgs_generate_messages_py)
endif()
