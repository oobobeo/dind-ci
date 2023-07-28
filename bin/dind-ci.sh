#! /bin/bash

set -e
echo 1
OPENAI_API_KEY=${1}
echo $OPENAI_API_KEY

if [ -z "${OPENAI_API_KEY}" ]; then
    echo "OPENAI_API_KEY is not set"
    exit 1
fi
echo 2
echo id $(id)
# docker build -t dind-ci1 . && \
docker run -d --rm -e OPENAI_API_KEY=${OPENAI_API_KEY} -v /var/run/docker.sock:/var/run/docker.sock dind-ci1
echo 4
