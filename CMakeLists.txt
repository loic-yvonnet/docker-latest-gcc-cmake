cmake_minimum_required(VERSION 3.16)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(GCC_COMPILE_FLAGS "-Wall -Wextra -Werror -Wsuggest-override -Wno-register -Wno-missing-braces -Wno-unknown-pragmas -fdiagnostics-show-option")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${GCC_COMPILE_FLAGS}")
project(hello_world)
add_executable(hello_world
                    src/main.cpp
)
