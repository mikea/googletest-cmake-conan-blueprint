cmake_minimum_required(VERSION 3.5)
project(pcxx)

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

enable_testing()
find_package(GTest REQUIRED)

add_executable(main_test main_test.cc)
target_link_libraries(main_test GTest::GTest GTest::Main)

add_test(all_tests bin/main_test)
