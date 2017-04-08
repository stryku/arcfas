cmake_minimum_required(VERSION 3.2.3 FATAL_ERROR)
project(arcfas)

include(CheckCXXCompilerFlag)

CHECK_CXX_COMPILER_FLAG("-std=c++14" COMPILER_SUPPORTS_CXX14)
CHECK_CXX_COMPILER_FLAG("-std=c++11" COMPILER_SUPPORTS_CXX11)
CHECK_CXX_COMPILER_FLAG("-std=c++0x" COMPILER_SUPPORTS_CXX0X)

if(COMPILER_SUPPORTS_CXX14)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")
elseif(COMPILER_SUPPORTS_CXX11)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
elseif(COMPILER_SUPPORTS_CXX0X)

    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
else()
        message(STATUS "The compiler ${CMAKE_CXX_COMPILER} doesn't have C++11 support. Please use a different C++ compiler.")
endif()

include (Local.cmake)
set (CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/modules")

SET ( dep_DIR ${CMAKE_SOURCE_DIR} )
FIND_PACKAGE ( dep )

IF ( DEP_FOUND )
    add_definitions(-std=c++1z)

    INCLUDE_DIRECTORIES (${ZEROMQ_INCLUDE_DIR})
    INCLUDE_DIRECTORIES (${BOOST_INCLUDE_DIR})

    add_subdirectory(thirdparty)
    add_subdirectory(sources)
ENDIF ( DEP_FOUND )


