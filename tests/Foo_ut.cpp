#include <gmock/gmock.h>

#include "TmpClass.hpp"

TEST(Foo, simpleTest)
{
    TmpClass sut;
    EXPECT_EQ(":eldo:", sut.foo());
}
