#! /bin/bash

set -e

OPENAI_API_KEY=${1}
REPO=${2}

ctnid=$(docker container ls | grep fastapi-deploy | cut -d' ' -f1)
if [[ $ctnid ]]; then
    docker container rm -f $ctnid
fi

# run tests
docker run -it --rm -d -p 8888:8888 --name fastapi-test -e OPENAI_API_KEY=${OPENAI_API_KEY} ${REPO}:fastapi
bin/test.sh
if [[ $? -ne 0 ]]; then
    @echo "Tests failed"
    exit 1;
fi
docker container rm -f fastapi-test

# deploy
docker run -d \
            -p 80:80 \
            --name fastapi-deploy \
            -e OPENAI_API_KEY=${OPENAI_API_KEY} \
            ${REPO}:fastapi
