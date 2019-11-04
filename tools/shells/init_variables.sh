#!/bin/bash

# Directories
export shells_directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
export workspace_directory=${shells_directory}/../..
export src_directory=${workspace_directory}/src
export build_directory=${workspace_directory}/build
export release_directory=${workspace_directory}/release
export tools_directory=${workspace_directory}/tools
export docker_directory=${tools_directory}/docker

# Docker
export docker_image=loic-yvo/ubuntu/gcc
export docker_image_version=${docker_image}:latest
export container_alias=devenv-latest
export docker_compose_path=${docker_directory}/compose.yml
export docker_workspace_directory=/home/develop/dev
export docker_build_directory=${docker_workspace_directory}/build
export docker_release_directory=${docker_workspace_directory}/release

# Others
export target_program_name=hello_world
export target_program_path=${build_directory}/bin/${target_program_name}
export docker_target_program_path=${docker_build_directory}/bin/${target_program_name}
