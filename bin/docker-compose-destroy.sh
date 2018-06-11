#!/usr/bin/env bash

readonly SCRIPT_SOURCE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "${SCRIPT_SOURCE}/../docker/" || exit 1

docker-compose down --rmi all --volumes --remove-orphans
