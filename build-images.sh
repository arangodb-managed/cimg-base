#!/usr/bin/env bash

DOCKERIMAGE=arangodboasis/cimg-base:${CIRCLE_TAG:-$CIRCLE_BRANCH-$CIRCLE_SHA1}"}
echo Building ${DOCKERIMAGE}

docker buildx install
docker build \
    --platform linux/amd64,linux/arm64 \
    --push \
    --file 20.04/Dockerfile
    -t ${DOCKERIMAGE} .
