include (ExternalProject)

set_property (DIRECTORY PROPERTY EP_BASE Dependencies)

set (DEPENDENCIES)
set (EXTRA_CMAKE_ARGS)

# Use static linking to avoid issues with system-wide installations of Boost.
list (APPEND DEPENDENCIES ep_boost)
ExternalProject_Add (ep_boost
  URL http://sourceforge.net/projects/boost/files/boost/1.55.0/boost_1_55_0.tar.bz2/download
  URL_MD5 d6eef4b4cacb2183f2bf265a5a03a354
  CONFIGURE_COMMAND ./bootstrap.sh --with-libraries=atomic,date_time,filesystem,program_options,system,thread
  BUILD_COMMAND ./b2 link=static
  BUILD_IN_SOURCE 1
  INSTALL_COMMAND ""
  )
list (APPEND EXTRA_CMAKE_ARGS
  -DBOOST_ROOT=${CMAKE_CURRENT_BINARY_DIR}/Dependencies/Source/ep_boost
  -DBoost_NO_SYSTEM_PATHS=ON)

# FIXME add to default target "all"?
ExternalProject_Add (ep_blah
  DEPENDS ${DEPENDENCIES}
  SOURCE_DIR ${PROJECT_SOURCE_DIR}
  CMAKE_ARGS -DUSE_SUPERBUILD=OFF ${EXTRA_CMAKE_ARGS}
  INSTALL_COMMAND ""
  BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/blah)
