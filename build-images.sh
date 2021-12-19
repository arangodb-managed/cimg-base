#!/usr/bin/env bash

DOCKERIMAGE=arangodboasis/cimg-base:${CIRCLE_TAG:-$CIRCLE_BRANCH-$CIRCLE_SHA1}
echo Building ${DOCKERIMAGE}

if [ "$1" = "latest" ]; then
    regctl image copy ${DOCKERIMAGE} arangodboasis/cimg-base:latest
else
    docker buildx install
    docker build \
        --platform linux/amd64,linux/arm64 \
        --push \
        --file 20.04/Dockerfile \
        -t ${DOCKERIMAGE} .
fi
