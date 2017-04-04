cmake_minimum_required(VERSION 2.8)
project(arcfas_tests)

# GMOCK
set(GMOCK_DIR ${CMAKE_SOURCE_DIR}/thirdparty/googletest)
add_subdirectory(${GMOCK_DIR} ${CMAKE_BINARY_DIR}/gmock)
include_directories(SYSTEM ${GMOCK_DIR}/include ${GMOCK_DIR}/gtest/include)
include_directories(${CMAKE_SOURCE_DIR}/src/)

# TESTS
add_executable(fooTests Foo_ut.cpp)

target_link_libraries(fooTests gmock_main arcfas_src)

# CTEST
enable_testing()
add_test(Foo fooTests)
