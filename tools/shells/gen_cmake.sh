#!/bin/bash

# Initialize environment variables
current_directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
. ${current_directory}/init_variables.sh

# Make sure the build directory exists
mkdir -p ${build_directory}

# Execute CMake
docker exec -it -w ${docker_build_directory} ${container_alias} cmake -DCMAKE_BUILD_TYPE=Debug ..
