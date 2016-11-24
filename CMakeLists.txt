cmake_minimum_required(VERSION 3.5)
project(pcxx)

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

enable_testing()

find_package(Threads REQUIRED)

add_executable(main_test main_test.cc)
set_property(TARGET main_test PROPERTY CXX_STANDARD 14)
target_link_libraries(main_test gtest gtest_main  gmock gmock_main Threads::Threads)

add_test(all_tests bin/main_test)
