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

# Utility rule file for step1_gencpp.

# Include any custom commands dependencies for this target.
include step1/CMakeFiles/step1_gencpp.dir/compiler_depend.make

# Include the progress variables for this target.
include step1/CMakeFiles/step1_gencpp.dir/progress.make

step1_gencpp: step1/CMakeFiles/step1_gencpp.dir/build.make
.PHONY : step1_gencpp

# Rule to build all files generated by this target.
step1/CMakeFiles/step1_gencpp.dir/build: step1_gencpp
.PHONY : step1/CMakeFiles/step1_gencpp.dir/build

step1/CMakeFiles/step1_gencpp.dir/clean:
	cd /home/mahdi/Desktop/Robotics/project5/hw5_ws/build/step1 && $(CMAKE_COMMAND) -P CMakeFiles/step1_gencpp.dir/cmake_clean.cmake
.PHONY : step1/CMakeFiles/step1_gencpp.dir/clean

step1/CMakeFiles/step1_gencpp.dir/depend:
	cd /home/mahdi/Desktop/Robotics/project5/hw5_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mahdi/Desktop/Robotics/project5/hw5_ws/src /home/mahdi/Desktop/Robotics/project5/hw5_ws/src/step1 /home/mahdi/Desktop/Robotics/project5/hw5_ws/build /home/mahdi/Desktop/Robotics/project5/hw5_ws/build/step1 /home/mahdi/Desktop/Robotics/project5/hw5_ws/build/step1/CMakeFiles/step1_gencpp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : step1/CMakeFiles/step1_gencpp.dir/depend

