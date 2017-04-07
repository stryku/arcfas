SET ( ZEROMQ_FIND_REQUIRED TRUE )
SET ( BOOST_FIND_REQUIRED TRUE )

### ZeroMQ ###

FIND_PATH ( ZEROMQ_INCLUDE_DIR NAMES zmq.hpp PATHS /usr/include/ /usr/local/include/ )
FIND_LIBRARY ( ZEROMQ_LIBRARY NAMES zmq PATHS /usr/lib /usr/local/lib )

IF ( ZEROMQ_INCLUDE_DIR AND ZEROMQ_LIBRARY )
    SET ( ZEROMQ_FOUND TRUE )
ENDIF ( ZEROMQ_INCLUDE_DIR AND ZEROMQ_LIBRARY )


IF ( ZEROMQ_FOUND )
    SET ( DEP_FOUND TRUE )
    IF ( NOT ZEROMQ_FIND_QUIETLY )
        MESSAGE ( STATUS "Found ZeroMQ:" )
        MESSAGE ( STATUS "  (Headers)       ${ZEROMQ_INCLUDE_DIR}" )
        MESSAGE ( STATUS "  (Library)       ${ZEROMQ_LIBRARY}" )
    ENDIF ( NOT ZEROMQ_FIND_QUIETLY )
ELSE ( ZEROMQ_FOUND )
    SET ( DEP_FOUND FALSE )
    IF ( ZEROMQ_FIND_REQUIRED )
        MESSAGE ( FATAL_ERROR "Could not find ZeroMQ" )
    ENDIF ( ZEROMQ_FIND_REQUIRED )
ENDIF ( ZEROMQ_FOUND )


### boost ###

FIND_PACKAGE(Boost 1.58.0 COMPONENTS date_time filesystem system )

IF ( Boost_FOUND )
    SET ( DEP_FOUND TRUE )
    MESSAGE ( STATUS "Found boost libs: ${BOOST_LIBRARIES}" )
ELSE ( Boost_FOUND )
    SET ( DEP_FOUND FALSE )
    MESSAGE ( FATAL_ERROR "Could not find boost" )
ENDIF ( Boost_FOUND )


### threads ###

FIND_PACKAGE(Threads)

IF ( Threads_FOUND )
    SET ( DEP_FOUND TRUE )
    MESSAGE ( STATUS "Found Threads libs: ${CMAKE_THREAD_LIBS_INIT}" )
ELSE ( Threads_FOUND )
    SET ( DEP_FOUND FALSE )
    MESSAGE ( FATAL_ERROR "Could not find Threads" )
ENDIF ( Threads_FOUND )

