#include "TmpClass.hpp"

#include <boost/array.hpp>
#include <zmq.hpp>

#include <string>

std::string TmpClass::foo() const
{
    boost::array<int, 3> arr;
    zmq::message_t msg;

    return ":eldo:, with arr size " + std::to_string(arr.size()) + " and zmq::msg size: " + std::to_string(msg.size());
}
