#!/usr/bin/env bash
set -e
set -o pipefail

if [ "${DEBUG:-false}" = "true" ]; then
  set -x
fi

cd /app

npm ci
npm run build
npm run start