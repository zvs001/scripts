
COMMENT=$1 # Expect first argument

if [[ ! $COMMENT ]]; then
  echo 'Command requires argument! Example:';
  echo "    git-check-comment mycomment";
  exit 1
fi

# check for not allowed comments
if git diff --cached | grep "^[+d].*$COMMENT"; then
    echo
    echo "You are trying to commit not allowed comment: $COMMENT"
    exit 1
fi
