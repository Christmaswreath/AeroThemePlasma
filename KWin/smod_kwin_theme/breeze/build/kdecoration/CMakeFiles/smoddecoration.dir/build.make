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

# Include any dependencies generated for this target.
include kdecoration/CMakeFiles/smoddecoration.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include kdecoration/CMakeFiles/smoddecoration.dir/compiler_depend.make

# Include the progress variables for this target.
include kdecoration/CMakeFiles/smoddecoration.dir/progress.make

# Include the compile flags for this target's objects.
include kdecoration/CMakeFiles/smoddecoration.dir/flags.make

kdecoration/smoddecoration_autogen/timestamp: /usr/bin/moc
kdecoration/smoddecoration_autogen/timestamp: kdecoration/CMakeFiles/smoddecoration.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/anon/Desktop/smod_reduced/breeze/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Automatic MOC for target smoddecoration"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/cmake -E cmake_autogen /home/anon/Desktop/smod_reduced/breeze/build/kdecoration/CMakeFiles/smoddecoration_autogen.dir/AutogenInfo.json ""
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/cmake -E touch /home/anon/Desktop/smod_reduced/breeze/build/kdecoration/smoddecoration_autogen/timestamp

kdecoration/CMakeFiles/smoddecoration.dir/smoddecoration_autogen/mocs_compilation.cpp.o: kdecoration/CMakeFiles/smoddecoration.dir/flags.make
kdecoration/CMakeFiles/smoddecoration.dir/smoddecoration_autogen/mocs_compilation.cpp.o: kdecoration/smoddecoration_autogen/mocs_compilation.cpp
kdecoration/CMakeFiles/smoddecoration.dir/smoddecoration_autogen/mocs_compilation.cpp.o: kdecoration/CMakeFiles/smoddecoration.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/anon/Desktop/smod_reduced/breeze/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object kdecoration/CMakeFiles/smoddecoration.dir/smoddecoration_autogen/mocs_compilation.cpp.o"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT kdecoration/CMakeFiles/smoddecoration.dir/smoddecoration_autogen/mocs_compilation.cpp.o -MF CMakeFiles/smoddecoration.dir/smoddecoration_autogen/mocs_compilation.cpp.o.d -o CMakeFiles/smoddecoration.dir/smoddecoration_autogen/mocs_compilation.cpp.o -c /home/anon/Desktop/smod_reduced/breeze/build/kdecoration/smoddecoration_autogen/mocs_compilation.cpp

kdecoration/CMakeFiles/smoddecoration.dir/smoddecoration_autogen/mocs_compilation.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/smoddecoration.dir/smoddecoration_autogen/mocs_compilation.cpp.i"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/anon/Desktop/smod_reduced/breeze/build/kdecoration/smoddecoration_autogen/mocs_compilation.cpp > CMakeFiles/smoddecoration.dir/smoddecoration_autogen/mocs_compilation.cpp.i

kdecoration/CMakeFiles/smoddecoration.dir/smoddecoration_autogen/mocs_compilation.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/smoddecoration.dir/smoddecoration_autogen/mocs_compilation.cpp.s"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/anon/Desktop/smod_reduced/breeze/build/kdecoration/smoddecoration_autogen/mocs_compilation.cpp -o CMakeFiles/smoddecoration.dir/smoddecoration_autogen/mocs_compilation.cpp.s

kdecoration/CMakeFiles/smoddecoration.dir/breezebutton.cpp.o: kdecoration/CMakeFiles/smoddecoration.dir/flags.make
kdecoration/CMakeFiles/smoddecoration.dir/breezebutton.cpp.o: /home/anon/Desktop/smod_reduced/breeze/kdecoration/breezebutton.cpp
kdecoration/CMakeFiles/smoddecoration.dir/breezebutton.cpp.o: kdecoration/CMakeFiles/smoddecoration.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/anon/Desktop/smod_reduced/breeze/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object kdecoration/CMakeFiles/smoddecoration.dir/breezebutton.cpp.o"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT kdecoration/CMakeFiles/smoddecoration.dir/breezebutton.cpp.o -MF CMakeFiles/smoddecoration.dir/breezebutton.cpp.o.d -o CMakeFiles/smoddecoration.dir/breezebutton.cpp.o -c /home/anon/Desktop/smod_reduced/breeze/kdecoration/breezebutton.cpp

kdecoration/CMakeFiles/smoddecoration.dir/breezebutton.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/smoddecoration.dir/breezebutton.cpp.i"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/anon/Desktop/smod_reduced/breeze/kdecoration/breezebutton.cpp > CMakeFiles/smoddecoration.dir/breezebutton.cpp.i

kdecoration/CMakeFiles/smoddecoration.dir/breezebutton.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/smoddecoration.dir/breezebutton.cpp.s"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/anon/Desktop/smod_reduced/breeze/kdecoration/breezebutton.cpp -o CMakeFiles/smoddecoration.dir/breezebutton.cpp.s

kdecoration/CMakeFiles/smoddecoration.dir/breezedecoration.cpp.o: kdecoration/CMakeFiles/smoddecoration.dir/flags.make
kdecoration/CMakeFiles/smoddecoration.dir/breezedecoration.cpp.o: /home/anon/Desktop/smod_reduced/breeze/kdecoration/breezedecoration.cpp
kdecoration/CMakeFiles/smoddecoration.dir/breezedecoration.cpp.o: kdecoration/CMakeFiles/smoddecoration.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/anon/Desktop/smod_reduced/breeze/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object kdecoration/CMakeFiles/smoddecoration.dir/breezedecoration.cpp.o"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT kdecoration/CMakeFiles/smoddecoration.dir/breezedecoration.cpp.o -MF CMakeFiles/smoddecoration.dir/breezedecoration.cpp.o.d -o CMakeFiles/smoddecoration.dir/breezedecoration.cpp.o -c /home/anon/Desktop/smod_reduced/breeze/kdecoration/breezedecoration.cpp

kdecoration/CMakeFiles/smoddecoration.dir/breezedecoration.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/smoddecoration.dir/breezedecoration.cpp.i"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/anon/Desktop/smod_reduced/breeze/kdecoration/breezedecoration.cpp > CMakeFiles/smoddecoration.dir/breezedecoration.cpp.i

kdecoration/CMakeFiles/smoddecoration.dir/breezedecoration.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/smoddecoration.dir/breezedecoration.cpp.s"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/anon/Desktop/smod_reduced/breeze/kdecoration/breezedecoration.cpp -o CMakeFiles/smoddecoration.dir/breezedecoration.cpp.s

kdecoration/CMakeFiles/smoddecoration.dir/breezesettingsprovider.cpp.o: kdecoration/CMakeFiles/smoddecoration.dir/flags.make
kdecoration/CMakeFiles/smoddecoration.dir/breezesettingsprovider.cpp.o: /home/anon/Desktop/smod_reduced/breeze/kdecoration/breezesettingsprovider.cpp
kdecoration/CMakeFiles/smoddecoration.dir/breezesettingsprovider.cpp.o: kdecoration/CMakeFiles/smoddecoration.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/anon/Desktop/smod_reduced/breeze/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object kdecoration/CMakeFiles/smoddecoration.dir/breezesettingsprovider.cpp.o"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT kdecoration/CMakeFiles/smoddecoration.dir/breezesettingsprovider.cpp.o -MF CMakeFiles/smoddecoration.dir/breezesettingsprovider.cpp.o.d -o CMakeFiles/smoddecoration.dir/breezesettingsprovider.cpp.o -c /home/anon/Desktop/smod_reduced/breeze/kdecoration/breezesettingsprovider.cpp

kdecoration/CMakeFiles/smoddecoration.dir/breezesettingsprovider.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/smoddecoration.dir/breezesettingsprovider.cpp.i"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/anon/Desktop/smod_reduced/breeze/kdecoration/breezesettingsprovider.cpp > CMakeFiles/smoddecoration.dir/breezesettingsprovider.cpp.i

kdecoration/CMakeFiles/smoddecoration.dir/breezesettingsprovider.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/smoddecoration.dir/breezesettingsprovider.cpp.s"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/anon/Desktop/smod_reduced/breeze/kdecoration/breezesettingsprovider.cpp -o CMakeFiles/smoddecoration.dir/breezesettingsprovider.cpp.s

kdecoration/CMakeFiles/smoddecoration.dir/smod/qgraphicsgloweffect.cpp.o: kdecoration/CMakeFiles/smoddecoration.dir/flags.make
kdecoration/CMakeFiles/smoddecoration.dir/smod/qgraphicsgloweffect.cpp.o: /home/anon/Desktop/smod_reduced/breeze/kdecoration/smod/qgraphicsgloweffect.cpp
kdecoration/CMakeFiles/smoddecoration.dir/smod/qgraphicsgloweffect.cpp.o: kdecoration/CMakeFiles/smoddecoration.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/anon/Desktop/smod_reduced/breeze/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object kdecoration/CMakeFiles/smoddecoration.dir/smod/qgraphicsgloweffect.cpp.o"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT kdecoration/CMakeFiles/smoddecoration.dir/smod/qgraphicsgloweffect.cpp.o -MF CMakeFiles/smoddecoration.dir/smod/qgraphicsgloweffect.cpp.o.d -o CMakeFiles/smoddecoration.dir/smod/qgraphicsgloweffect.cpp.o -c /home/anon/Desktop/smod_reduced/breeze/kdecoration/smod/qgraphicsgloweffect.cpp

kdecoration/CMakeFiles/smoddecoration.dir/smod/qgraphicsgloweffect.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/smoddecoration.dir/smod/qgraphicsgloweffect.cpp.i"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/anon/Desktop/smod_reduced/breeze/kdecoration/smod/qgraphicsgloweffect.cpp > CMakeFiles/smoddecoration.dir/smod/qgraphicsgloweffect.cpp.i

kdecoration/CMakeFiles/smoddecoration.dir/smod/qgraphicsgloweffect.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/smoddecoration.dir/smod/qgraphicsgloweffect.cpp.s"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/anon/Desktop/smod_reduced/breeze/kdecoration/smod/qgraphicsgloweffect.cpp -o CMakeFiles/smoddecoration.dir/smod/qgraphicsgloweffect.cpp.s

# Object files for target smoddecoration
smoddecoration_OBJECTS = \
"CMakeFiles/smoddecoration.dir/smoddecoration_autogen/mocs_compilation.cpp.o" \
"CMakeFiles/smoddecoration.dir/breezebutton.cpp.o" \
"CMakeFiles/smoddecoration.dir/breezedecoration.cpp.o" \
"CMakeFiles/smoddecoration.dir/breezesettingsprovider.cpp.o" \
"CMakeFiles/smoddecoration.dir/smod/qgraphicsgloweffect.cpp.o"

# External object files for target smoddecoration
smoddecoration_EXTERNAL_OBJECTS =

bin/smoddecoration.so: kdecoration/CMakeFiles/smoddecoration.dir/smoddecoration_autogen/mocs_compilation.cpp.o
bin/smoddecoration.so: kdecoration/CMakeFiles/smoddecoration.dir/breezebutton.cpp.o
bin/smoddecoration.so: kdecoration/CMakeFiles/smoddecoration.dir/breezedecoration.cpp.o
bin/smoddecoration.so: kdecoration/CMakeFiles/smoddecoration.dir/breezesettingsprovider.cpp.o
bin/smoddecoration.so: kdecoration/CMakeFiles/smoddecoration.dir/smod/qgraphicsgloweffect.cpp.o
bin/smoddecoration.so: kdecoration/CMakeFiles/smoddecoration.dir/build.make
bin/smoddecoration.so: lib/libsmoddecoration_STATIC.a
bin/smoddecoration.so: kdecoration/CMakeFiles/smoddecoration.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/anon/Desktop/smod_reduced/breeze/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking CXX shared module ../bin/smoddecoration.so"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/smoddecoration.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
kdecoration/CMakeFiles/smoddecoration.dir/build: bin/smoddecoration.so
.PHONY : kdecoration/CMakeFiles/smoddecoration.dir/build

kdecoration/CMakeFiles/smoddecoration.dir/clean:
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && $(CMAKE_COMMAND) -P CMakeFiles/smoddecoration.dir/cmake_clean.cmake
.PHONY : kdecoration/CMakeFiles/smoddecoration.dir/clean

kdecoration/CMakeFiles/smoddecoration.dir/depend: kdecoration/smoddecoration_autogen/timestamp
	cd /home/anon/Desktop/smod_reduced/breeze/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/anon/Desktop/smod_reduced/breeze /home/anon/Desktop/smod_reduced/breeze/kdecoration /home/anon/Desktop/smod_reduced/breeze/build /home/anon/Desktop/smod_reduced/breeze/build/kdecoration /home/anon/Desktop/smod_reduced/breeze/build/kdecoration/CMakeFiles/smoddecoration.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : kdecoration/CMakeFiles/smoddecoration.dir/depend

