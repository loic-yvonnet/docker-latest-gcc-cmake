#!/bin/bash

# Initialize environment variables
current_directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
. ${current_directory}/init_variables.sh

# Start the container
docker-compose -f ${docker_compose_path} run --service-ports --name ${container_alias} dev-image bash
