cmake_minimum_required(VERSION 3.24)
project(System-Programming-Services VERSION 1.0.0 LANGUAGES CXX) 


# Common Compiler Flags
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


#common binary path
set(OUTPUT_DIR ${CMAKE_BINARY_DIR}/bin)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${OUTPUT_DIR})

set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${OUTPUT_DIR})

# Tell CMake where to find the other pieces
add_subdirectory(thirdparty)
add_subdirectory(src)

# create and executable
add_executable(worker main.cxx)
target_link_libraries(worker PRIVATE gdb-help-lib)


target_compile_options(worker PRIVATE -Wall -Wextra -Werror)