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
CMAKE_SOURCE_DIR = /mnt/dba39c4b-f659-456f-8698-0058d9b0d301/home/anon/Desktop/Aero_Theme/KWin/kwin_fixblur

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/dba39c4b-f659-456f-8698-0058d9b0d301/home/anon/Desktop/Aero_Theme/KWin/kwin_fixblur/build

# Utility rule file for kwin4_effect_customblur_config_autogen_timestamp_deps.

# Include any custom commands dependencies for this target.
include src/kcm/CMakeFiles/kwin4_effect_customblur_config_autogen_timestamp_deps.dir/compiler_depend.make

# Include the progress variables for this target.
include src/kcm/CMakeFiles/kwin4_effect_customblur_config_autogen_timestamp_deps.dir/progress.make

src/kcm/CMakeFiles/kwin4_effect_customblur_config_autogen_timestamp_deps: src/kcm/blur_config.json
src/kcm/CMakeFiles/kwin4_effect_customblur_config_autogen_timestamp_deps: /usr/lib/libKF5ConfigWidgets.so.5.112.0
src/kcm/CMakeFiles/kwin4_effect_customblur_config_autogen_timestamp_deps: /usr/bin/moc
src/kcm/CMakeFiles/kwin4_effect_customblur_config_autogen_timestamp_deps: /usr/lib/libQt5Core.so.5.15.11
src/kcm/CMakeFiles/kwin4_effect_customblur_config_autogen_timestamp_deps: /usr/lib/libQt5DBus.so.5.15.11
src/kcm/CMakeFiles/kwin4_effect_customblur_config_autogen_timestamp_deps: /usr/lib/libkdecorations2.so.5.27.10
src/kcm/CMakeFiles/kwin4_effect_customblur_config_autogen_timestamp_deps: /usr/lib/libQt5Gui.so.5.15.11
src/kcm/CMakeFiles/kwin4_effect_customblur_config_autogen_timestamp_deps: /usr/lib/libKF5WaylandServer.so.5.112.0
src/kcm/CMakeFiles/kwin4_effect_customblur_config_autogen_timestamp_deps: /usr/lib/libKF5ConfigCore.so.5.112.0
src/kcm/CMakeFiles/kwin4_effect_customblur_config_autogen_timestamp_deps: /usr/lib/libKF5ConfigGui.so.5.112.0
src/kcm/CMakeFiles/kwin4_effect_customblur_config_autogen_timestamp_deps: /usr/lib/libKF5WindowSystem.so.5.112.0
src/kcm/CMakeFiles/kwin4_effect_customblur_config_autogen_timestamp_deps: /usr/lib/libKF5CoreAddons.so.5.112.0
src/kcm/CMakeFiles/kwin4_effect_customblur_config_autogen_timestamp_deps: /usr/lib/libepoxy.so
src/kcm/CMakeFiles/kwin4_effect_customblur_config_autogen_timestamp_deps: /usr/lib/libkwineffects.so
src/kcm/CMakeFiles/kwin4_effect_customblur_config_autogen_timestamp_deps: /usr/lib/libKF5WaylandClient.so.5.112.0
src/kcm/CMakeFiles/kwin4_effect_customblur_config_autogen_timestamp_deps: /usr/lib/libkwinglutils.so

src/kcm/blur_config.json: /mnt/dba39c4b-f659-456f-8698-0058d9b0d301/home/anon/Desktop/Aero_Theme/KWin/kwin_fixblur/src/kcm/blur_config.desktop
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/mnt/dba39c4b-f659-456f-8698-0058d9b0d301/home/anon/Desktop/Aero_Theme/KWin/kwin_fixblur/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating blur_config.json"
	cd /mnt/dba39c4b-f659-456f-8698-0058d9b0d301/home/anon/Desktop/Aero_Theme/KWin/kwin_fixblur/src/kcm && /usr/bin/desktoptojson -i blur_config.desktop -o /mnt/dba39c4b-f659-456f-8698-0058d9b0d301/home/anon/Desktop/Aero_Theme/KWin/kwin_fixblur/build/src/kcm/blur_config.json -s /usr/share/kservicetypes5/kcmodule.desktop

kwin4_effect_customblur_config_autogen_timestamp_deps: src/kcm/CMakeFiles/kwin4_effect_customblur_config_autogen_timestamp_deps
kwin4_effect_customblur_config_autogen_timestamp_deps: src/kcm/blur_config.json
kwin4_effect_customblur_config_autogen_timestamp_deps: src/kcm/CMakeFiles/kwin4_effect_customblur_config_autogen_timestamp_deps.dir/build.make
.PHONY : kwin4_effect_customblur_config_autogen_timestamp_deps

# Rule to build all files generated by this target.
src/kcm/CMakeFiles/kwin4_effect_customblur_config_autogen_timestamp_deps.dir/build: kwin4_effect_customblur_config_autogen_timestamp_deps
.PHONY : src/kcm/CMakeFiles/kwin4_effect_customblur_config_autogen_timestamp_deps.dir/build

src/kcm/CMakeFiles/kwin4_effect_customblur_config_autogen_timestamp_deps.dir/clean:
	cd /mnt/dba39c4b-f659-456f-8698-0058d9b0d301/home/anon/Desktop/Aero_Theme/KWin/kwin_fixblur/build/src/kcm && $(CMAKE_COMMAND) -P CMakeFiles/kwin4_effect_customblur_config_autogen_timestamp_deps.dir/cmake_clean.cmake
.PHONY : src/kcm/CMakeFiles/kwin4_effect_customblur_config_autogen_timestamp_deps.dir/clean

src/kcm/CMakeFiles/kwin4_effect_customblur_config_autogen_timestamp_deps.dir/depend:
	cd /mnt/dba39c4b-f659-456f-8698-0058d9b0d301/home/anon/Desktop/Aero_Theme/KWin/kwin_fixblur/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/dba39c4b-f659-456f-8698-0058d9b0d301/home/anon/Desktop/Aero_Theme/KWin/kwin_fixblur /mnt/dba39c4b-f659-456f-8698-0058d9b0d301/home/anon/Desktop/Aero_Theme/KWin/kwin_fixblur/src/kcm /mnt/dba39c4b-f659-456f-8698-0058d9b0d301/home/anon/Desktop/Aero_Theme/KWin/kwin_fixblur/build /mnt/dba39c4b-f659-456f-8698-0058d9b0d301/home/anon/Desktop/Aero_Theme/KWin/kwin_fixblur/build/src/kcm /mnt/dba39c4b-f659-456f-8698-0058d9b0d301/home/anon/Desktop/Aero_Theme/KWin/kwin_fixblur/build/src/kcm/CMakeFiles/kwin4_effect_customblur_config_autogen_timestamp_deps.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : src/kcm/CMakeFiles/kwin4_effect_customblur_config_autogen_timestamp_deps.dir/depend

