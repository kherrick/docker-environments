#!/usr/bin/env bash

readonly SCRIPT_SOURCE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "${SCRIPT_SOURCE}"/.. || exit 1

readonly REPOSITORY='kherrick'
readonly IMAGE='alpine-elixir-node'
readonly VERSION='1.0'

cd docker/"${IMAGE}"/ || exit 1

docker build -t "${REPOSITORY}"/"${IMAGE}" -t "${REPOSITORY}"/"${IMAGE}":"${VERSION}" .
