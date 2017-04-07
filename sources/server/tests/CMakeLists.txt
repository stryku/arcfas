cmake_minimum_required(VERSION 2.8)
project(arcfas_tests)

# GMOCK
set(GMOCK_DIR ${CMAKE_SOURCE_DIR}/thirdparty/googletest)
add_subdirectory(${GMOCK_DIR} ${CMAKE_BINARY_DIR}/googlemock)
include_directories(SYSTEM ${GMOCK_DIR}/googletest/include ${GMOCK_DIR}/googlemock/include)
include_directories(${ARCFAS_SERVER_INC_DIR})

# TESTS
add_executable(fooTests Foo_ut.cpp $<TARGET_OBJECTS:arcfas_server_objs>)

target_link_libraries(fooTests
        gmock_main
        ${ZEROMQ_LIBRARY}
        )

# CTEST
enable_testing()
add_test(Foo fooTests)
