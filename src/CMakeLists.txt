cmake_minimum_required(VERSION 2.8)
project(arcfas_src)

file(GLOB src *.cpp)
set(Sources ${src})

include_directories(${CMAKE_SOURCE_DIR}/inc/)

add_library(${PROJECT_NAME} SHARED ${Sources})

add_executable(arcfas ${Sources})

target_link_libraries(arcfas ${CMAKE_THREAD_LIBS_INIT}
                             ${ZEROMQ_LIBRARY} )
