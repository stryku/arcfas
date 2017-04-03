cmake_minimum_required(VERSION 2.8)
project(arcfas_src)

file(GLOB src *.cpp)
set(Sources ${src})

add_library(${PROJECT_NAME} SHARED ${Sources})

target_link_libraries(arcfas_src)
add_executable(arcfas ${Sources})
