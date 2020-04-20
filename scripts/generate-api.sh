#!/bin/sh

docker run --rm -v ${PWD}:/local openapitools/openapi-generator-cli generate \
    -i /local/shared/api.yml \
    -g typescript-axios \
    -o /local/front/api

docker-compose run --rm front yarn lint \
    --rule 'no-unused-vars:off' \
    --rule '@typescript-eslint/no-unused-vars:off' \
    --rule 'node/no-deprecated-api:off' \
    --fix --no-ignore api
