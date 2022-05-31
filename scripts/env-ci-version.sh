
if [[ ! $PROJECT_VERSION ]]; then
  source env-version
fi

# replace patch version
[[ ! -z "$CIRCLE_BUILD_NUM" ]] && export BUNDLE_VERSION=${CIRCLE_BUILD_NUM}
[[ ! -z "$BITRISE_BUILD_NUMBER" ]] && export BUNDLE_VERSION=${BITRISE_BUILD_NUMBER}

export PROJECT_VERSION="$APP_VERSION.$BUNDLE_VERSION"
