# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.26

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/mahdi/.local/lib/python3.8/site-packages/cmake/data/bin/cmake

# The command to remove a file.
RM = /home/mahdi/.local/lib/python3.8/site-packages/cmake/data/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/mahdi/Desktop/Robotics/project5/hw5_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/mahdi/Desktop/Robotics/project5/hw5_ws/build

# Include any dependencies generated for this target.
include turtlebot3_simulations/turtlebot3_fake/CMakeFiles/turtlebot3_fake_node.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include turtlebot3_simulations/turtlebot3_fake/CMakeFiles/turtlebot3_fake_node.dir/compiler_depend.make

# Include the progress variables for this target.
include turtlebot3_simulations/turtlebot3_fake/CMakeFiles/turtlebot3_fake_node.dir/progress.make

# Include the compile flags for this target's objects.
include turtlebot3_simulations/turtlebot3_fake/CMakeFiles/turtlebot3_fake_node.dir/flags.make

turtlebot3_simulations/turtlebot3_fake/CMakeFiles/turtlebot3_fake_node.dir/src/turtlebot3_fake.cpp.o: turtlebot3_simulations/turtlebot3_fake/CMakeFiles/turtlebot3_fake_node.dir/flags.make
turtlebot3_simulations/turtlebot3_fake/CMakeFiles/turtlebot3_fake_node.dir/src/turtlebot3_fake.cpp.o: /home/mahdi/Desktop/Robotics/project5/hw5_ws/src/turtlebot3_simulations/turtlebot3_fake/src/turtlebot3_fake.cpp
turtlebot3_simulations/turtlebot3_fake/CMakeFiles/turtlebot3_fake_node.dir/src/turtlebot3_fake.cpp.o: turtlebot3_simulations/turtlebot3_fake/CMakeFiles/turtlebot3_fake_node.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mahdi/Desktop/Robotics/project5/hw5_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object turtlebot3_simulations/turtlebot3_fake/CMakeFiles/turtlebot3_fake_node.dir/src/turtlebot3_fake.cpp.o"
	cd /home/mahdi/Desktop/Robotics/project5/hw5_ws/build/turtlebot3_simulations/turtlebot3_fake && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT turtlebot3_simulations/turtlebot3_fake/CMakeFiles/turtlebot3_fake_node.dir/src/turtlebot3_fake.cpp.o -MF CMakeFiles/turtlebot3_fake_node.dir/src/turtlebot3_fake.cpp.o.d -o CMakeFiles/turtlebot3_fake_node.dir/src/turtlebot3_fake.cpp.o -c /home/mahdi/Desktop/Robotics/project5/hw5_ws/src/turtlebot3_simulations/turtlebot3_fake/src/turtlebot3_fake.cpp

turtlebot3_simulations/turtlebot3_fake/CMakeFiles/turtlebot3_fake_node.dir/src/turtlebot3_fake.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/turtlebot3_fake_node.dir/src/turtlebot3_fake.cpp.i"
	cd /home/mahdi/Desktop/Robotics/project5/hw5_ws/build/turtlebot3_simulations/turtlebot3_fake && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mahdi/Desktop/Robotics/project5/hw5_ws/src/turtlebot3_simulations/turtlebot3_fake/src/turtlebot3_fake.cpp > CMakeFiles/turtlebot3_fake_node.dir/src/turtlebot3_fake.cpp.i

turtlebot3_simulations/turtlebot3_fake/CMakeFiles/turtlebot3_fake_node.dir/src/turtlebot3_fake.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/turtlebot3_fake_node.dir/src/turtlebot3_fake.cpp.s"
	cd /home/mahdi/Desktop/Robotics/project5/hw5_ws/build/turtlebot3_simulations/turtlebot3_fake && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mahdi/Desktop/Robotics/project5/hw5_ws/src/turtlebot3_simulations/turtlebot3_fake/src/turtlebot3_fake.cpp -o CMakeFiles/turtlebot3_fake_node.dir/src/turtlebot3_fake.cpp.s

# Object files for target turtlebot3_fake_node
turtlebot3_fake_node_OBJECTS = \
"CMakeFiles/turtlebot3_fake_node.dir/src/turtlebot3_fake.cpp.o"

# External object files for target turtlebot3_fake_node
turtlebot3_fake_node_EXTERNAL_OBJECTS =

/home/mahdi/Desktop/Robotics/project5/hw5_ws/devel/lib/turtlebot3_fake/turtlebot3_fake_node: turtlebot3_simulations/turtlebot3_fake/CMakeFiles/turtlebot3_fake_node.dir/src/turtlebot3_fake.cpp.o
/home/mahdi/Desktop/Robotics/project5/hw5_ws/devel/lib/turtlebot3_fake/turtlebot3_fake_node: turtlebot3_simulations/turtlebot3_fake/CMakeFiles/turtlebot3_fake_node.dir/build.make
/home/mahdi/Desktop/Robotics/project5/hw5_ws/devel/lib/turtlebot3_fake/turtlebot3_fake_node: /opt/ros/noetic/lib/libtf.so
/home/mahdi/Desktop/Robotics/project5/hw5_ws/devel/lib/turtlebot3_fake/turtlebot3_fake_node: /opt/ros/noetic/lib/libtf2_ros.so
/home/mahdi/Desktop/Robotics/project5/hw5_ws/devel/lib/turtlebot3_fake/turtlebot3_fake_node: /opt/ros/noetic/lib/libactionlib.so
/home/mahdi/Desktop/Robotics/project5/hw5_ws/devel/lib/turtlebot3_fake/turtlebot3_fake_node: /opt/ros/noetic/lib/libmessage_filters.so
/home/mahdi/Desktop/Robotics/project5/hw5_ws/devel/lib/turtlebot3_fake/turtlebot3_fake_node: /opt/ros/noetic/lib/libroscpp.so
/home/mahdi/Desktop/Robotics/project5/hw5_ws/devel/lib/turtlebot3_fake/turtlebot3_fake_node: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/mahdi/Desktop/Robotics/project5/hw5_ws/devel/lib/turtlebot3_fake/turtlebot3_fake_node: /usr/lib/x86_64-linux-gnu/libboost_chrono.so.1.71.0
/home/mahdi/Desktop/Robotics/project5/hw5_ws/devel/lib/turtlebot3_fake/turtlebot3_fake_node: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so.1.71.0
/home/mahdi/Desktop/Robotics/project5/hw5_ws/devel/lib/turtlebot3_fake/turtlebot3_fake_node: /opt/ros/noetic/lib/libxmlrpcpp.so
/home/mahdi/Desktop/Robotics/project5/hw5_ws/devel/lib/turtlebot3_fake/turtlebot3_fake_node: /opt/ros/noetic/lib/libtf2.so
/home/mahdi/Desktop/Robotics/project5/hw5_ws/devel/lib/turtlebot3_fake/turtlebot3_fake_node: /opt/ros/noetic/lib/librosconsole.so
/home/mahdi/Desktop/Robotics/project5/hw5_ws/devel/lib/turtlebot3_fake/turtlebot3_fake_node: /opt/ros/noetic/lib/librosconsole_log4cxx.so
/home/mahdi/Desktop/Robotics/project5/hw5_ws/devel/lib/turtlebot3_fake/turtlebot3_fake_node: /opt/ros/noetic/lib/librosconsole_backend_interface.so
/home/mahdi/Desktop/Robotics/project5/hw5_ws/devel/lib/turtlebot3_fake/turtlebot3_fake_node: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/mahdi/Desktop/Robotics/project5/hw5_ws/devel/lib/turtlebot3_fake/turtlebot3_fake_node: /usr/lib/x86_64-linux-gnu/libboost_regex.so.1.71.0
/home/mahdi/Desktop/Robotics/project5/hw5_ws/devel/lib/turtlebot3_fake/turtlebot3_fake_node: /opt/ros/noetic/lib/libroscpp_serialization.so
/home/mahdi/Desktop/Robotics/project5/hw5_ws/devel/lib/turtlebot3_fake/turtlebot3_fake_node: /opt/ros/noetic/lib/librostime.so
/home/mahdi/Desktop/Robotics/project5/hw5_ws/devel/lib/turtlebot3_fake/turtlebot3_fake_node: /usr/lib/x86_64-linux-gnu/libboost_date_time.so.1.71.0
/home/mahdi/Desktop/Robotics/project5/hw5_ws/devel/lib/turtlebot3_fake/turtlebot3_fake_node: /opt/ros/noetic/lib/libcpp_common.so
/home/mahdi/Desktop/Robotics/project5/hw5_ws/devel/lib/turtlebot3_fake/turtlebot3_fake_node: /usr/lib/x86_64-linux-gnu/libboost_system.so.1.71.0
/home/mahdi/Desktop/Robotics/project5/hw5_ws/devel/lib/turtlebot3_fake/turtlebot3_fake_node: /usr/lib/x86_64-linux-gnu/libboost_thread.so.1.71.0
/home/mahdi/Desktop/Robotics/project5/hw5_ws/devel/lib/turtlebot3_fake/turtlebot3_fake_node: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so.0.4
/home/mahdi/Desktop/Robotics/project5/hw5_ws/devel/lib/turtlebot3_fake/turtlebot3_fake_node: turtlebot3_simulations/turtlebot3_fake/CMakeFiles/turtlebot3_fake_node.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mahdi/Desktop/Robotics/project5/hw5_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/mahdi/Desktop/Robotics/project5/hw5_ws/devel/lib/turtlebot3_fake/turtlebot3_fake_node"
	cd /home/mahdi/Desktop/Robotics/project5/hw5_ws/build/turtlebot3_simulations/turtlebot3_fake && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/turtlebot3_fake_node.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
turtlebot3_simulations/turtlebot3_fake/CMakeFiles/turtlebot3_fake_node.dir/build: /home/mahdi/Desktop/Robotics/project5/hw5_ws/devel/lib/turtlebot3_fake/turtlebot3_fake_node
.PHONY : turtlebot3_simulations/turtlebot3_fake/CMakeFiles/turtlebot3_fake_node.dir/build

turtlebot3_simulations/turtlebot3_fake/CMakeFiles/turtlebot3_fake_node.dir/clean:
	cd /home/mahdi/Desktop/Robotics/project5/hw5_ws/build/turtlebot3_simulations/turtlebot3_fake && $(CMAKE_COMMAND) -P CMakeFiles/turtlebot3_fake_node.dir/cmake_clean.cmake
.PHONY : turtlebot3_simulations/turtlebot3_fake/CMakeFiles/turtlebot3_fake_node.dir/clean

turtlebot3_simulations/turtlebot3_fake/CMakeFiles/turtlebot3_fake_node.dir/depend:
	cd /home/mahdi/Desktop/Robotics/project5/hw5_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mahdi/Desktop/Robotics/project5/hw5_ws/src /home/mahdi/Desktop/Robotics/project5/hw5_ws/src/turtlebot3_simulations/turtlebot3_fake /home/mahdi/Desktop/Robotics/project5/hw5_ws/build /home/mahdi/Desktop/Robotics/project5/hw5_ws/build/turtlebot3_simulations/turtlebot3_fake /home/mahdi/Desktop/Robotics/project5/hw5_ws/build/turtlebot3_simulations/turtlebot3_fake/CMakeFiles/turtlebot3_fake_node.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : turtlebot3_simulations/turtlebot3_fake/CMakeFiles/turtlebot3_fake_node.dir/depend

