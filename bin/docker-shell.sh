#!/usr/bin/env bash

readonly SCRIPT_SOURCE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "${SCRIPT_SOURCE}"/.. || exit 1

cd docker/alpine-elixir-node/ || exit 1

docker exec -it kherrick_alpine-elixir-node su user
