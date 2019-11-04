# GCC 10 Docker

# Introduction

The purpose of this repository is to provide a simple way to use a custom version of a compiler in Visual Studio Code, without modifying the host environment. Docker is used to install a specific toolchain. Visual Studio Code is configured to use the Docker container when the current folder is open.

This repo contains a simple docker-based toolchain that includes:
* Ubuntu latest (Ubuntu 18.04 LTS at the time of writing).
* GCC latest (GCC 10 at the time of writing).
* CMake latest (CMake 3.16 at the time of writing).
* GDB shipped with Ubuntu latest (GDB 8.1 at the time of writing).

This approach was inspired by:
* [Develop C++ on Docker with VSCode](https://medium.com/@aharon.amir/develop-c-on-docker-with-vscode-98fb85b818b2).
* [VSCode-Docker-Cpp](https://github.com/tttapa/VSCode-Docker-Cpp).

The main differences compared to the above approaches are:
* The version of GCC and related tools.
* The VS Code tasks are also available as command line shells.

# Getting started

## Prerequisites on the host

Some tools have to be installed on the host machine:
* Visual Studio Code
* Docker
* Docker Compose

On Ubuntu 18.04, it is possible to install the dependencies (and a couple of other useful tools) with the following shell:

```shell
./tools/shells/install_prerequisites.sh
```

If not on Ubuntu, you will need to install the prerequisites manually.

## Building a simple Hello World

From the command line:
```shell
./tools/shells/build_docker_image.sh
./tools/shells/start_container.sh
./tools/shells/gen_cmake.sh
./tools/shells/compile.sh
./tools/shells/run.sh
./tools/shells/stop_container.sh
```

In other words:
* **build_docker_image.sh**: Builds a Docker image named loic.yvo/ubuntu/gcc:latest. You should run it overnight as it recompiles GCC and CMake from source.
* **start_container.sh**: Spawns a Docker container from this image with Docker Compose to bind the host filesystem with the guest's.
* **gen_cmake.sh**: Uses CMake to generate the Makefile for the solution.
* **compile.sh**: Compiles the solution in debug mode.
* **run.sh**: Runs the application. It should display "Hello, World" if everything worked out.
* **stop_container.sh**: Stops the Docker container.

Please note that it was successfully tested on Ubuntu 18.04 on November, 2019.

## Debugging from the command line

Using 3 tabs from the command line:
```shell
# Tab1
./tools/shells/start_container.sh
# Tab2
./tools/shells/start_gdbserver.sh
# Tab3
cd ./build/bin
gdb hello_world
b main.cpp:4
target remote :2000
c
bt
```

In other words:
* In the first tab, you respawn the Docker container.
* In the second tab, you start gdbserver from the Docker container on port 2000, running hello_world.
* In the third tab, you start gdb with the host hello_world and you set a breakpoint at line 4 in main.cpp. Then, you attach the local gdb session to the remote gdbserver on port 2000. After that, you can continue the execution and display the backtrace once you hit the breakpoint.

## Debugging from Visual Studio Code

Making it simple to debug from Visual Studio Code is the whole point of this repository. Just follow these steps:
* Open the current folder. This will load the content of .vscode. In turn, this will launch the Docker container.
* Open main.cpp and set a breakpoint at line 4.
* Press F5. This will automatically start the gdbserver from the Docker container, and attach the execution to it.

# Going further

Just fork this repository and then replace the container name and the application name by your own:
```shell
find . -type f | xargs grep loic.yvo/ubuntu/gcc | cut -d: -f1 | sort | uniq | sed -i s@loic.yvo/ubuntu/gcc@your_containe_name_here@g
find . -type f | xargs grep hello_world | cut -d: -f1 | sort | uniq | sed -i s/hello_world/your_app_name_here/g
```

Then, you can add files to the `src` folder, and edit the `CMakeFiles.txt`.
