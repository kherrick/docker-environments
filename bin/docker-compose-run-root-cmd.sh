#!/usr/bin/env bash

readonly SCRIPT_SOURCE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "${SCRIPT_SOURCE}/../docker/" || exit 1

docker-compose exec -u root kherrick_alpine-elixir-node-phoenix bash -c "$*"
