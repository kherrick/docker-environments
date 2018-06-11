#!/usr/bin/env bash

readonly SCRIPT_SOURCE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "${SCRIPT_SOURCE}/../docker/" || exit 1

if [[ -f shared/database/.gitignore ]]; then
  rm shared/database/.gitignore
fi

docker-compose up -d
