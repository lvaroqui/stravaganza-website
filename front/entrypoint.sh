#!/bin/bash

if [[ $@ == "clean" ]] && [[ -d node_modules ]]; then
  rm -rf node_modules
  exit 0
fi

# Run yarn install (only takes about ~1s if we are up to date)
yarn install --frozen-lockfile

# Clean cache, we don't need to keep it
yarn cache clean

# Run provided command
$@