#!/bin/bash

# REQUIREMENTS
if ! command -v json &> /dev/null
then
    echo "json is required for script. Run next command to install it:" >&2
    echo "    "
    echo "    npm i -g json" >&2
    echo "    "
    exit 127;
fi
# REQUIREMENTS END


if [[ ! $PROJECT_VERSION ]]; then
  echo 'PROJECT_VERSION is not set. Using defaults from: env-version'
  source env-version
fi

if [[ -f package.json ]]; then
  cat package.json | npx json -e "this.version=\"${PROJECT_VERSION}\"" > package.json.tmp
  mv package.json.tmp package2.json
else
  echo 'package.json file is not found'
fi
