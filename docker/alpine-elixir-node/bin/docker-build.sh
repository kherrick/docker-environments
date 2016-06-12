#!/usr/bin/env bash

readonly SCRIPT_SOURCE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly REPOSITORY='kherrick'
readonly IMAGE='alpine-elixir-node'
readonly VERSION='1.0'

cd "${SCRIPT_SOURCE}"/.. || exit 1

docker build -t "${REPOSITORY}"/"${IMAGE}" -t "${REPOSITORY}"/"${IMAGE}":"${VERSION}" .
