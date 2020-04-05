#!/bin/sh
echo "Running lint-staged"
FILES=$(git diff --name-only --cached | grep -E "^front/.*\.(js|ts|vue)$" | cut -c 7-)

if [[ -z $FILES ]]; then
  echo "No files need linting"
  exit 0 # No file staged to lint
fi

# Stashing unstaged changes
git commit -q --no-verify -m 'Save index'
git stash -q
git reset -q --soft HEAD~

# Running Lint on staged files
docker-compose run front yarn lint $FILES
ret=$?

# Re-applying unstaged changes
if [[ ret -ne 0 ]]; then
  echo "Linting error detected"
  git commit -q --no-verify -m 'Save index'
  git stash pop -q
  git reset -q HEAD
  git reset -q --soft HEAD~
fi


exit $ret
