#! /bin/bash

set -e

OPENAI_API_KEY=${1}

if [ -z "${OPENAI_API_KEY}" ]; then
    echo "OPENAI_API_KEY is not set"
    exit 1
fi

# run dind-ci 
docker build -t dind-ci . && \
docker run --rm -it -e OPENAI_API_KEY=${OPENAI_API_KEY} -v /var/run/docker.sock:/var/run/docker.sock dind-ci sh
