#!/bin/bash

# Initialize environment variables
current_directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
. ${current_directory}/init_variables.sh

# Start gdb server and attach the target program
docker exec -d ${container_alias} gdbserver :2000 ${docker_target_program_path}
