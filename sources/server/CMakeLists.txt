cmake_minimum_required(VERSION 2.8)
project(arcfas_server)

SET(ARCFAS_SERVER_INC_DIR ${CMAKE_CURRENT_SOURCE_DIR}/inc)
SET(ARCFAS_SERVER_SRC_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src)

MESSAGE("ARCFAS_SERVER_INC_DIR: " ${ARCFAS_SERVER_INC_DIR})
MESSAGE("ARCFAS_SERVER_SRC_DIR: " ${ARCFAS_SERVER_SRC_DIR})


INCLUDE(Sources.cmake)

include_directories(${ARCFAS_SERVER_INC_DIR}
                    ${THIRDPARTY_INC_DIR})

ADD_LIBRARY(arcfas_server_objs OBJECT ${ARCFAS_SERVER_SRC} ${ARCFAS_SERVER_INC})

add_subdirectory(tests)

add_executable(arcfas_server $<TARGET_OBJECTS:arcfas_server_objs> )

target_link_libraries(arcfas_server
        ${CMAKE_THREAD_LIBS_INIT}
        ${ZMQ_LIBRARIES} )
