# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/anon/Desktop/smod_reduced/breeze

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/anon/Desktop/smod_reduced/breeze/build

# Utility rule file for smoddecoration_STATIC_autogen_timestamp_deps.

# Include any custom commands dependencies for this target.
include kdecoration/CMakeFiles/smoddecoration_STATIC_autogen_timestamp_deps.dir/compiler_depend.make

# Include the progress variables for this target.
include kdecoration/CMakeFiles/smoddecoration_STATIC_autogen_timestamp_deps.dir/progress.make

kdecoration/CMakeFiles/smoddecoration_STATIC_autogen_timestamp_deps: /usr/lib/libKF5ConfigWidgets.so.5.112.0
kdecoration/CMakeFiles/smoddecoration_STATIC_autogen_timestamp_deps: /usr/bin/moc
kdecoration/CMakeFiles/smoddecoration_STATIC_autogen_timestamp_deps: /usr/lib/libkdecorations2.so.5.27.10
kdecoration/CMakeFiles/smoddecoration_STATIC_autogen_timestamp_deps: /usr/lib/libKF5GuiAddons.so.5.112.0
kdecoration/CMakeFiles/smoddecoration_STATIC_autogen_timestamp_deps: /usr/lib/libKF5ConfigCore.so.5.112.0
kdecoration/CMakeFiles/smoddecoration_STATIC_autogen_timestamp_deps: /usr/lib/libKF5CoreAddons.so.5.112.0
kdecoration/CMakeFiles/smoddecoration_STATIC_autogen_timestamp_deps: /usr/lib/libKF5IconThemes.so.5.112.0
kdecoration/CMakeFiles/smoddecoration_STATIC_autogen_timestamp_deps: /usr/lib/libKF5I18n.so.5.112.0

smoddecoration_STATIC_autogen_timestamp_deps: kdecoration/CMakeFiles/smoddecoration_STATIC_autogen_timestamp_deps
smoddecoration_STATIC_autogen_timestamp_deps: kdecoration/CMakeFiles/smoddecoration_STATIC_autogen_timestamp_deps.dir/build.make
.PHONY : smoddecoration_STATIC_autogen_timestamp_deps

# Rule to build all files generated by this target.
kdecoration/CMakeFiles/smoddecoration_STATIC_autogen_timestamp_deps.dir/build: smoddecoration_STATIC_autogen_timestamp_deps
.PHONY : kdecoration/CMakeFiles/smoddecoration_STATIC_autogen_timestamp_deps.dir/build

kdecoration/CMakeFiles/smoddecoration_STATIC_autogen_timestamp_deps.dir/clean:
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && $(CMAKE_COMMAND) -P CMakeFiles/smoddecoration_STATIC_autogen_timestamp_deps.dir/cmake_clean.cmake
.PHONY : kdecoration/CMakeFiles/smoddecoration_STATIC_autogen_timestamp_deps.dir/clean

kdecoration/CMakeFiles/smoddecoration_STATIC_autogen_timestamp_deps.dir/depend:
	cd /home/anon/Desktop/smod_reduced/breeze/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/anon/Desktop/smod_reduced/breeze /home/anon/Desktop/smod_reduced/breeze/kdecoration /home/anon/Desktop/smod_reduced/breeze/build /home/anon/Desktop/smod_reduced/breeze/build/kdecoration /home/anon/Desktop/smod_reduced/breeze/build/kdecoration/CMakeFiles/smoddecoration_STATIC_autogen_timestamp_deps.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : kdecoration/CMakeFiles/smoddecoration_STATIC_autogen_timestamp_deps.dir/depend

