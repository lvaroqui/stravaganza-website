#!/bin/bash

if [[ $@ == "clean" ]]; then
  if [[ -d node_modules ]]; then
    rm -rf node_modules
  fi
  if [[ -d .nuxt ]]; then
    rm -rf .nuxt
  fi
  exit 0
fi

if [[ $@ == "install" ]]; then
  yarn install
  exit 0
fi

# Run yarn install (only takes about ~1s if we are up to date)
yarn install --frozen-lockfile

# run command with exec to pass control
echo "Running CMD: $@"
exec "$@"