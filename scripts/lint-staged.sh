#!/bin/sh
echo "Running lint-staged"
FILES=$(git diff --name-only --cached | grep -E "^front/.*\.(js|ts|vue)$" | cut -c 7-)

if [[ -z $FILES ]]; then
  echo "No files to lint"
  exit 0
fi

git stash --keep-index

# Running Lint on staged files
docker-compose run front yarn lint $FILES
ret=$?

git stash pop

exit $ret
