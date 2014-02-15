cmake_minimum_required (VERSION 2.8)

# Handle superbuild first
option (USE_SUPERBUILD "Whether or not a superbuild should be invoked" ON)

if (USE_SUPERBUILD)
  project (SUPERBUILD NONE)
  # execute the superbuild (this script will be invoked again without the
  # USE_SUPERBUILD option this time)
  include (cmake/SuperBuild.cmake)
  return()                      # stop processing this file further
else()
  project (Blah)                # <-- YOUR PROJECT NAME HERE
endif()

#
# <usual CMakeLists.txt stuff goes here...>
#

set (CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set (CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set (CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)

add_subdirectory (src)
