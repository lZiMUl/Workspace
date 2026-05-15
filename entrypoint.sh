#!/usr/bin/env bash
set -e
set -o pipefail

if [ "${DEBUG:-false}" = "true" ]; then
  set -x
fi

cd /app

npm run start