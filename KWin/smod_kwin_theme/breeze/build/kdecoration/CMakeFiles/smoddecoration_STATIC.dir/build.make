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
include kdecoration/CMakeFiles/smoddecoration_STATIC.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include kdecoration/CMakeFiles/smoddecoration_STATIC.dir/compiler_depend.make

# Include the progress variables for this target.
include kdecoration/CMakeFiles/smoddecoration_STATIC.dir/progress.make

# Include the compile flags for this target's objects.
include kdecoration/CMakeFiles/smoddecoration_STATIC.dir/flags.make

kdecoration/ui_breezeconfigurationui.h: /home/anon/Desktop/smod_reduced/breeze/kdecoration/config/ui/breezeconfigurationui.ui
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/anon/Desktop/smod_reduced/breeze/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating ui_breezeconfigurationui.h"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/cmake -DKDE_UIC_EXECUTABLE:FILEPATH=/usr/bin/uic -DKDE_UIC_FILE:FILEPATH=/home/anon/Desktop/smod_reduced/breeze/kdecoration/config/ui/breezeconfigurationui.ui -DKDE_UIC_H_FILE:FILEPATH=/home/anon/Desktop/smod_reduced/breeze/build/kdecoration/ui_breezeconfigurationui.h -DKDE_UIC_BASENAME:STRING=breezeconfigurationui -P /usr/lib/cmake/KF5I18n/kf5i18nuic.cmake

kdecoration/ui_breezeexceptiondialog.h: /home/anon/Desktop/smod_reduced/breeze/kdecoration/config/ui/breezeexceptiondialog.ui
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/anon/Desktop/smod_reduced/breeze/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating ui_breezeexceptiondialog.h"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/cmake -DKDE_UIC_EXECUTABLE:FILEPATH=/usr/bin/uic -DKDE_UIC_FILE:FILEPATH=/home/anon/Desktop/smod_reduced/breeze/kdecoration/config/ui/breezeexceptiondialog.ui -DKDE_UIC_H_FILE:FILEPATH=/home/anon/Desktop/smod_reduced/breeze/build/kdecoration/ui_breezeexceptiondialog.h -DKDE_UIC_BASENAME:STRING=breezeexceptiondialog -P /usr/lib/cmake/KF5I18n/kf5i18nuic.cmake

kdecoration/ui_breezeexceptionlistwidget.h: /home/anon/Desktop/smod_reduced/breeze/kdecoration/config/ui/breezeexceptionlistwidget.ui
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/anon/Desktop/smod_reduced/breeze/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Generating ui_breezeexceptionlistwidget.h"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/cmake -DKDE_UIC_EXECUTABLE:FILEPATH=/usr/bin/uic -DKDE_UIC_FILE:FILEPATH=/home/anon/Desktop/smod_reduced/breeze/kdecoration/config/ui/breezeexceptionlistwidget.ui -DKDE_UIC_H_FILE:FILEPATH=/home/anon/Desktop/smod_reduced/breeze/build/kdecoration/ui_breezeexceptionlistwidget.h -DKDE_UIC_BASENAME:STRING=breezeexceptionlistwidget -P /usr/lib/cmake/KF5I18n/kf5i18nuic.cmake

kdecoration/breezesettings.h: /home/anon/Desktop/smod_reduced/breeze/kdecoration/breezesettings.kcfgc
kdecoration/breezesettings.h: /home/anon/Desktop/smod_reduced/breeze/kdecoration/breezesettingsdata.kcfg
kdecoration/breezesettings.h: /usr/lib/kf5/kconfig_compiler_kf5
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/anon/Desktop/smod_reduced/breeze/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Generating breezesettings.h, breezesettings.cpp"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/lib/kf5/kconfig_compiler_kf5 /home/anon/Desktop/smod_reduced/breeze/kdecoration/breezesettingsdata.kcfg /home/anon/Desktop/smod_reduced/breeze/kdecoration/breezesettings.kcfgc -d /home/anon/Desktop/smod_reduced/breeze/build/kdecoration/

kdecoration/breezesettings.cpp: kdecoration/breezesettings.h
	@$(CMAKE_COMMAND) -E touch_nocreate kdecoration/breezesettings.cpp

kdecoration/smoddecoration_STATIC_autogen/timestamp: /usr/bin/moc
kdecoration/smoddecoration_STATIC_autogen/timestamp: kdecoration/CMakeFiles/smoddecoration_STATIC.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/anon/Desktop/smod_reduced/breeze/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Automatic MOC for target smoddecoration_STATIC"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/cmake -E cmake_autogen /home/anon/Desktop/smod_reduced/breeze/build/kdecoration/CMakeFiles/smoddecoration_STATIC_autogen.dir/AutogenInfo.json ""
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/cmake -E touch /home/anon/Desktop/smod_reduced/breeze/build/kdecoration/smoddecoration_STATIC_autogen/timestamp

kdecoration/CMakeFiles/smoddecoration_STATIC.dir/smoddecoration_STATIC_autogen/mocs_compilation.cpp.o: kdecoration/CMakeFiles/smoddecoration_STATIC.dir/flags.make
kdecoration/CMakeFiles/smoddecoration_STATIC.dir/smoddecoration_STATIC_autogen/mocs_compilation.cpp.o: kdecoration/smoddecoration_STATIC_autogen/mocs_compilation.cpp
kdecoration/CMakeFiles/smoddecoration_STATIC.dir/smoddecoration_STATIC_autogen/mocs_compilation.cpp.o: kdecoration/CMakeFiles/smoddecoration_STATIC.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/anon/Desktop/smod_reduced/breeze/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object kdecoration/CMakeFiles/smoddecoration_STATIC.dir/smoddecoration_STATIC_autogen/mocs_compilation.cpp.o"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT kdecoration/CMakeFiles/smoddecoration_STATIC.dir/smoddecoration_STATIC_autogen/mocs_compilation.cpp.o -MF CMakeFiles/smoddecoration_STATIC.dir/smoddecoration_STATIC_autogen/mocs_compilation.cpp.o.d -o CMakeFiles/smoddecoration_STATIC.dir/smoddecoration_STATIC_autogen/mocs_compilation.cpp.o -c /home/anon/Desktop/smod_reduced/breeze/build/kdecoration/smoddecoration_STATIC_autogen/mocs_compilation.cpp

kdecoration/CMakeFiles/smoddecoration_STATIC.dir/smoddecoration_STATIC_autogen/mocs_compilation.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/smoddecoration_STATIC.dir/smoddecoration_STATIC_autogen/mocs_compilation.cpp.i"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/anon/Desktop/smod_reduced/breeze/build/kdecoration/smoddecoration_STATIC_autogen/mocs_compilation.cpp > CMakeFiles/smoddecoration_STATIC.dir/smoddecoration_STATIC_autogen/mocs_compilation.cpp.i

kdecoration/CMakeFiles/smoddecoration_STATIC.dir/smoddecoration_STATIC_autogen/mocs_compilation.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/smoddecoration_STATIC.dir/smoddecoration_STATIC_autogen/mocs_compilation.cpp.s"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/anon/Desktop/smod_reduced/breeze/build/kdecoration/smoddecoration_STATIC_autogen/mocs_compilation.cpp -o CMakeFiles/smoddecoration_STATIC.dir/smoddecoration_STATIC_autogen/mocs_compilation.cpp.s

kdecoration/CMakeFiles/smoddecoration_STATIC.dir/breezeexceptionlist.cpp.o: kdecoration/CMakeFiles/smoddecoration_STATIC.dir/flags.make
kdecoration/CMakeFiles/smoddecoration_STATIC.dir/breezeexceptionlist.cpp.o: /home/anon/Desktop/smod_reduced/breeze/kdecoration/breezeexceptionlist.cpp
kdecoration/CMakeFiles/smoddecoration_STATIC.dir/breezeexceptionlist.cpp.o: kdecoration/CMakeFiles/smoddecoration_STATIC.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/anon/Desktop/smod_reduced/breeze/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object kdecoration/CMakeFiles/smoddecoration_STATIC.dir/breezeexceptionlist.cpp.o"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT kdecoration/CMakeFiles/smoddecoration_STATIC.dir/breezeexceptionlist.cpp.o -MF CMakeFiles/smoddecoration_STATIC.dir/breezeexceptionlist.cpp.o.d -o CMakeFiles/smoddecoration_STATIC.dir/breezeexceptionlist.cpp.o -c /home/anon/Desktop/smod_reduced/breeze/kdecoration/breezeexceptionlist.cpp

kdecoration/CMakeFiles/smoddecoration_STATIC.dir/breezeexceptionlist.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/smoddecoration_STATIC.dir/breezeexceptionlist.cpp.i"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/anon/Desktop/smod_reduced/breeze/kdecoration/breezeexceptionlist.cpp > CMakeFiles/smoddecoration_STATIC.dir/breezeexceptionlist.cpp.i

kdecoration/CMakeFiles/smoddecoration_STATIC.dir/breezeexceptionlist.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/smoddecoration_STATIC.dir/breezeexceptionlist.cpp.s"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/anon/Desktop/smod_reduced/breeze/kdecoration/breezeexceptionlist.cpp -o CMakeFiles/smoddecoration_STATIC.dir/breezeexceptionlist.cpp.s

kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeconfigwidget.cpp.o: kdecoration/CMakeFiles/smoddecoration_STATIC.dir/flags.make
kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeconfigwidget.cpp.o: /home/anon/Desktop/smod_reduced/breeze/kdecoration/config/breezeconfigwidget.cpp
kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeconfigwidget.cpp.o: kdecoration/CMakeFiles/smoddecoration_STATIC.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/anon/Desktop/smod_reduced/breeze/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeconfigwidget.cpp.o"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeconfigwidget.cpp.o -MF CMakeFiles/smoddecoration_STATIC.dir/config/breezeconfigwidget.cpp.o.d -o CMakeFiles/smoddecoration_STATIC.dir/config/breezeconfigwidget.cpp.o -c /home/anon/Desktop/smod_reduced/breeze/kdecoration/config/breezeconfigwidget.cpp

kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeconfigwidget.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/smoddecoration_STATIC.dir/config/breezeconfigwidget.cpp.i"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/anon/Desktop/smod_reduced/breeze/kdecoration/config/breezeconfigwidget.cpp > CMakeFiles/smoddecoration_STATIC.dir/config/breezeconfigwidget.cpp.i

kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeconfigwidget.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/smoddecoration_STATIC.dir/config/breezeconfigwidget.cpp.s"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/anon/Desktop/smod_reduced/breeze/kdecoration/config/breezeconfigwidget.cpp -o CMakeFiles/smoddecoration_STATIC.dir/config/breezeconfigwidget.cpp.s

kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezedetectwidget.cpp.o: kdecoration/CMakeFiles/smoddecoration_STATIC.dir/flags.make
kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezedetectwidget.cpp.o: /home/anon/Desktop/smod_reduced/breeze/kdecoration/config/breezedetectwidget.cpp
kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezedetectwidget.cpp.o: kdecoration/CMakeFiles/smoddecoration_STATIC.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/anon/Desktop/smod_reduced/breeze/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezedetectwidget.cpp.o"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezedetectwidget.cpp.o -MF CMakeFiles/smoddecoration_STATIC.dir/config/breezedetectwidget.cpp.o.d -o CMakeFiles/smoddecoration_STATIC.dir/config/breezedetectwidget.cpp.o -c /home/anon/Desktop/smod_reduced/breeze/kdecoration/config/breezedetectwidget.cpp

kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezedetectwidget.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/smoddecoration_STATIC.dir/config/breezedetectwidget.cpp.i"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/anon/Desktop/smod_reduced/breeze/kdecoration/config/breezedetectwidget.cpp > CMakeFiles/smoddecoration_STATIC.dir/config/breezedetectwidget.cpp.i

kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezedetectwidget.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/smoddecoration_STATIC.dir/config/breezedetectwidget.cpp.s"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/anon/Desktop/smod_reduced/breeze/kdecoration/config/breezedetectwidget.cpp -o CMakeFiles/smoddecoration_STATIC.dir/config/breezedetectwidget.cpp.s

kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptiondialog.cpp.o: kdecoration/CMakeFiles/smoddecoration_STATIC.dir/flags.make
kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptiondialog.cpp.o: /home/anon/Desktop/smod_reduced/breeze/kdecoration/config/breezeexceptiondialog.cpp
kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptiondialog.cpp.o: kdecoration/CMakeFiles/smoddecoration_STATIC.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/anon/Desktop/smod_reduced/breeze/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptiondialog.cpp.o"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptiondialog.cpp.o -MF CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptiondialog.cpp.o.d -o CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptiondialog.cpp.o -c /home/anon/Desktop/smod_reduced/breeze/kdecoration/config/breezeexceptiondialog.cpp

kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptiondialog.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptiondialog.cpp.i"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/anon/Desktop/smod_reduced/breeze/kdecoration/config/breezeexceptiondialog.cpp > CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptiondialog.cpp.i

kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptiondialog.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptiondialog.cpp.s"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/anon/Desktop/smod_reduced/breeze/kdecoration/config/breezeexceptiondialog.cpp -o CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptiondialog.cpp.s

kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptionlistwidget.cpp.o: kdecoration/CMakeFiles/smoddecoration_STATIC.dir/flags.make
kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptionlistwidget.cpp.o: /home/anon/Desktop/smod_reduced/breeze/kdecoration/config/breezeexceptionlistwidget.cpp
kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptionlistwidget.cpp.o: kdecoration/CMakeFiles/smoddecoration_STATIC.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/anon/Desktop/smod_reduced/breeze/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptionlistwidget.cpp.o"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptionlistwidget.cpp.o -MF CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptionlistwidget.cpp.o.d -o CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptionlistwidget.cpp.o -c /home/anon/Desktop/smod_reduced/breeze/kdecoration/config/breezeexceptionlistwidget.cpp

kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptionlistwidget.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptionlistwidget.cpp.i"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/anon/Desktop/smod_reduced/breeze/kdecoration/config/breezeexceptionlistwidget.cpp > CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptionlistwidget.cpp.i

kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptionlistwidget.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptionlistwidget.cpp.s"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/anon/Desktop/smod_reduced/breeze/kdecoration/config/breezeexceptionlistwidget.cpp -o CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptionlistwidget.cpp.s

kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptionmodel.cpp.o: kdecoration/CMakeFiles/smoddecoration_STATIC.dir/flags.make
kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptionmodel.cpp.o: /home/anon/Desktop/smod_reduced/breeze/kdecoration/config/breezeexceptionmodel.cpp
kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptionmodel.cpp.o: kdecoration/CMakeFiles/smoddecoration_STATIC.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/anon/Desktop/smod_reduced/breeze/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptionmodel.cpp.o"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptionmodel.cpp.o -MF CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptionmodel.cpp.o.d -o CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptionmodel.cpp.o -c /home/anon/Desktop/smod_reduced/breeze/kdecoration/config/breezeexceptionmodel.cpp

kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptionmodel.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptionmodel.cpp.i"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/anon/Desktop/smod_reduced/breeze/kdecoration/config/breezeexceptionmodel.cpp > CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptionmodel.cpp.i

kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptionmodel.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptionmodel.cpp.s"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/anon/Desktop/smod_reduced/breeze/kdecoration/config/breezeexceptionmodel.cpp -o CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptionmodel.cpp.s

kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeitemmodel.cpp.o: kdecoration/CMakeFiles/smoddecoration_STATIC.dir/flags.make
kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeitemmodel.cpp.o: /home/anon/Desktop/smod_reduced/breeze/kdecoration/config/breezeitemmodel.cpp
kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeitemmodel.cpp.o: kdecoration/CMakeFiles/smoddecoration_STATIC.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/anon/Desktop/smod_reduced/breeze/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building CXX object kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeitemmodel.cpp.o"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeitemmodel.cpp.o -MF CMakeFiles/smoddecoration_STATIC.dir/config/breezeitemmodel.cpp.o.d -o CMakeFiles/smoddecoration_STATIC.dir/config/breezeitemmodel.cpp.o -c /home/anon/Desktop/smod_reduced/breeze/kdecoration/config/breezeitemmodel.cpp

kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeitemmodel.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/smoddecoration_STATIC.dir/config/breezeitemmodel.cpp.i"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/anon/Desktop/smod_reduced/breeze/kdecoration/config/breezeitemmodel.cpp > CMakeFiles/smoddecoration_STATIC.dir/config/breezeitemmodel.cpp.i

kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeitemmodel.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/smoddecoration_STATIC.dir/config/breezeitemmodel.cpp.s"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/anon/Desktop/smod_reduced/breeze/kdecoration/config/breezeitemmodel.cpp -o CMakeFiles/smoddecoration_STATIC.dir/config/breezeitemmodel.cpp.s

kdecoration/CMakeFiles/smoddecoration_STATIC.dir/breezesettings.cpp.o: kdecoration/CMakeFiles/smoddecoration_STATIC.dir/flags.make
kdecoration/CMakeFiles/smoddecoration_STATIC.dir/breezesettings.cpp.o: kdecoration/breezesettings.cpp
kdecoration/CMakeFiles/smoddecoration_STATIC.dir/breezesettings.cpp.o: kdecoration/CMakeFiles/smoddecoration_STATIC.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/anon/Desktop/smod_reduced/breeze/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building CXX object kdecoration/CMakeFiles/smoddecoration_STATIC.dir/breezesettings.cpp.o"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT kdecoration/CMakeFiles/smoddecoration_STATIC.dir/breezesettings.cpp.o -MF CMakeFiles/smoddecoration_STATIC.dir/breezesettings.cpp.o.d -o CMakeFiles/smoddecoration_STATIC.dir/breezesettings.cpp.o -c /home/anon/Desktop/smod_reduced/breeze/build/kdecoration/breezesettings.cpp

kdecoration/CMakeFiles/smoddecoration_STATIC.dir/breezesettings.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/smoddecoration_STATIC.dir/breezesettings.cpp.i"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/anon/Desktop/smod_reduced/breeze/build/kdecoration/breezesettings.cpp > CMakeFiles/smoddecoration_STATIC.dir/breezesettings.cpp.i

kdecoration/CMakeFiles/smoddecoration_STATIC.dir/breezesettings.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/smoddecoration_STATIC.dir/breezesettings.cpp.s"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/anon/Desktop/smod_reduced/breeze/build/kdecoration/breezesettings.cpp -o CMakeFiles/smoddecoration_STATIC.dir/breezesettings.cpp.s

# Object files for target smoddecoration_STATIC
smoddecoration_STATIC_OBJECTS = \
"CMakeFiles/smoddecoration_STATIC.dir/smoddecoration_STATIC_autogen/mocs_compilation.cpp.o" \
"CMakeFiles/smoddecoration_STATIC.dir/breezeexceptionlist.cpp.o" \
"CMakeFiles/smoddecoration_STATIC.dir/config/breezeconfigwidget.cpp.o" \
"CMakeFiles/smoddecoration_STATIC.dir/config/breezedetectwidget.cpp.o" \
"CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptiondialog.cpp.o" \
"CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptionlistwidget.cpp.o" \
"CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptionmodel.cpp.o" \
"CMakeFiles/smoddecoration_STATIC.dir/config/breezeitemmodel.cpp.o" \
"CMakeFiles/smoddecoration_STATIC.dir/breezesettings.cpp.o"

# External object files for target smoddecoration_STATIC
smoddecoration_STATIC_EXTERNAL_OBJECTS =

lib/libsmoddecoration_STATIC.a: kdecoration/CMakeFiles/smoddecoration_STATIC.dir/smoddecoration_STATIC_autogen/mocs_compilation.cpp.o
lib/libsmoddecoration_STATIC.a: kdecoration/CMakeFiles/smoddecoration_STATIC.dir/breezeexceptionlist.cpp.o
lib/libsmoddecoration_STATIC.a: kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeconfigwidget.cpp.o
lib/libsmoddecoration_STATIC.a: kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezedetectwidget.cpp.o
lib/libsmoddecoration_STATIC.a: kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptiondialog.cpp.o
lib/libsmoddecoration_STATIC.a: kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptionlistwidget.cpp.o
lib/libsmoddecoration_STATIC.a: kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeexceptionmodel.cpp.o
lib/libsmoddecoration_STATIC.a: kdecoration/CMakeFiles/smoddecoration_STATIC.dir/config/breezeitemmodel.cpp.o
lib/libsmoddecoration_STATIC.a: kdecoration/CMakeFiles/smoddecoration_STATIC.dir/breezesettings.cpp.o
lib/libsmoddecoration_STATIC.a: kdecoration/CMakeFiles/smoddecoration_STATIC.dir/build.make
lib/libsmoddecoration_STATIC.a: kdecoration/CMakeFiles/smoddecoration_STATIC.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/anon/Desktop/smod_reduced/breeze/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Linking CXX static library ../lib/libsmoddecoration_STATIC.a"
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && $(CMAKE_COMMAND) -P CMakeFiles/smoddecoration_STATIC.dir/cmake_clean_target.cmake
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/smoddecoration_STATIC.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
kdecoration/CMakeFiles/smoddecoration_STATIC.dir/build: lib/libsmoddecoration_STATIC.a
.PHONY : kdecoration/CMakeFiles/smoddecoration_STATIC.dir/build

kdecoration/CMakeFiles/smoddecoration_STATIC.dir/clean:
	cd /home/anon/Desktop/smod_reduced/breeze/build/kdecoration && $(CMAKE_COMMAND) -P CMakeFiles/smoddecoration_STATIC.dir/cmake_clean.cmake
.PHONY : kdecoration/CMakeFiles/smoddecoration_STATIC.dir/clean

kdecoration/CMakeFiles/smoddecoration_STATIC.dir/depend: kdecoration/breezesettings.cpp
kdecoration/CMakeFiles/smoddecoration_STATIC.dir/depend: kdecoration/breezesettings.h
kdecoration/CMakeFiles/smoddecoration_STATIC.dir/depend: kdecoration/smoddecoration_STATIC_autogen/timestamp
kdecoration/CMakeFiles/smoddecoration_STATIC.dir/depend: kdecoration/ui_breezeconfigurationui.h
kdecoration/CMakeFiles/smoddecoration_STATIC.dir/depend: kdecoration/ui_breezeexceptiondialog.h
kdecoration/CMakeFiles/smoddecoration_STATIC.dir/depend: kdecoration/ui_breezeexceptionlistwidget.h
	cd /home/anon/Desktop/smod_reduced/breeze/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/anon/Desktop/smod_reduced/breeze /home/anon/Desktop/smod_reduced/breeze/kdecoration /home/anon/Desktop/smod_reduced/breeze/build /home/anon/Desktop/smod_reduced/breeze/build/kdecoration /home/anon/Desktop/smod_reduced/breeze/build/kdecoration/CMakeFiles/smoddecoration_STATIC.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : kdecoration/CMakeFiles/smoddecoration_STATIC.dir/depend

