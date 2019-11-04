#!/bin/bash

# Initialize environment variables
current_directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
. ${current_directory}/init_variables.sh

# Clean up
rm -rf ${build_directory}
