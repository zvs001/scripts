# REQUIREMENTS
if ! command -v json &> /dev/null
then
    echo "json is required for script. Run next command to install it:" >&2
    echo "    "
    echo "    npm i -g json" >&2
    echo "    "
    exit 127;
fi

if ! command -v sed &> /dev/null
then
    echo "sed is required for script. Install it before running script" >&2
    exit 127;
fi
# REQUIREMENTS END

SED_SEARCH_REGEX="s/^\([0-9]*\.[0-9]*\)\.\([0-9]*\)/"

export PROJECT_VERSION=$(cat ./package.json | npx json version) # x.x.x (major.minor.patch)
export APP_VERSION=$( echo $PROJECT_VERSION | sed $SED_SEARCH_REGEX"\1/" ) # "major.minor"
export BUNDLE_VERSION=$( echo $PROJECT_VERSION | sed $SED_SEARCH_REGEX"\2/" ) # "patch" version

# replace patch version
[[ ! -z "$CIRCLE_BUILD_NUM" ]] && export BUNDLE_VERSION=${CIRCLE_BUILD_NUM}
[[ ! -z "$BITRISE_BUILD_NUMBER" ]] && export BUNDLE_VERSION=${BITRISE_BUILD_NUMBER}

export PROJECT_VERSION="$APP_VERSION.$BUNDLE_VERSION"
