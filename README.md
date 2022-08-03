Lib provides scripts for development and CI use

[![npm](https://img.shields.io/npm/v/@zvs001/scripts)](https://www.npmjs.com/package/@zvs001/scripts)


# Install

`npm install -D @zvs001/scripts`

# Commands

## Commands for versioning

### env-version

Command extracts version from package.json and provides few env variables:
- `PROJECT_VERSION` # x.x.x (major.minor.patch)`
- `APP_VERSION` # "major.minor"`
- `BUNDLE_VERSION` # "patch" version

Cmd example:

```
source env-version;
echo $PROJECT_VERSION;
```

### env-ci-version

Replaces `BUNDLE_VERSION` with build number from ci (`$CIRCLE_BUILD_NUM`, `$BITRISE_BUILD_NUMBER`)

### apply-version

Replaces version in package.json by version from env variable: `PROJECT_VERSION`

## Commands for git

### git-check-comment

Designed for pre-commit script to check if git commits not allowed comments.

Cmd Example:
```
git-check-comment mycomment
```

### git-check-comments

Verifies that git will not commit next reserved comments:
`NOCOMMIT`, `NO-COMMIT`, `BLOCKCOMIT`, `BLOCK-COMMIT`, `BLOCK`, `STOP`


