#!/bin/bash

# REQUIREMENTS
PROJECT_VERSION=''  # x.x.x (major.minor.patch)
FILE=package.json


if command -v npx &> /dev/null
then
  # requires node installed
  PROJECT_VERSION=$(cat $FILE | npx json version)
fi


if command -v jq &> /dev/null
then
  PROJECT_VERSION=$(jq --raw-output '.version' $FILE)
fi


if [[ ! $PROJECT_VERSION ]]; then
  echo "You don't have required executables for script." >&2
  echo "Install one if them: json, npx, jq" >&2
  exit 127;
fi

if ! command -v sed &> /dev/null
then
    echo "sed is required for script. Install it before running script" >&2
    exit 127;
fi
# REQUIREMENTS END

SED_SEARCH_REGEX="s/^\([0-9]*\.[0-9]*\)\.\([0-9]*\)/"

export PROJECT_VERSION # x.x.x (major.minor.patch)
export APP_VERSION=$( echo $PROJECT_VERSION | sed $SED_SEARCH_REGEX"\1/" ) # "major.minor"
export BUNDLE_VERSION=$( echo $PROJECT_VERSION | sed $SED_SEARCH_REGEX"\2/" ) # "patch" version

export PROJECT_VERSION="$APP_VERSION.$BUNDLE_VERSION"
