cmake-superbuild
================

CMake SuperBuild template using External_Projects

How does it work?
-----------------

The top-level CMakeLists.txt works in a has 2 stages:

1. `USE_SUPERBUILD=ON` [the default]: Deleguates the generation to
   SuperBuild.cmake which will download and build the dependencies and then
   re-invoke the top-level CMakeLists.txt but this time with `USE_SUPERBUILD`
   set to `OFF`.

2. This step, when `USE_SUPERBUILD=OFF`, is the usual CMakeLists of the project,
   in a SuperBuild mode this will reside in the subdirectory blah of the
   SuperBuild directory.


Example using with the default method `USE_SUPERBUILD=ON`:

    $ mkdir super-build && cd super-build
    $ cmake ..
    $ # assuming the Unix Makefile generator was the default
    $ make
    <download and build dependencies...>
    <build main project "blah"...>
    $ # the project build directory is resides in blah/
    $ cd blah/
    $ pwd
    <...>/cmake-superbuild/build/blah
    $ ./bin/blah
    Hello World!

Example without the superbuild, the dependencies are taken care in some other
ways:

    $ mkdir build && cd build
    $ # assuming a proper version of Boost has been built and resides
    $ # in ~/pkg/boost_1_55_0
    $ cmake -DUSE_SUPERBUILD=OFF -DBOOST_ROOT=~/pkg/boost_1_55_0 ..
    $ make
    $ ./bin/blah
    Hello World!
