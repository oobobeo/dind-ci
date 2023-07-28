
ctnid=$(docker container ls | grep fastapi-prod-deploy | cut -d' ' -f1)
if [[ $ctnid ]]; then
    docker container rm -f $ctnid
fi

# test
docker run -it --rm -p 80:80 fastapi-test-deploy
bin/test.sh
if [[ $? -ne 0 ]]; then
    @echo "Tests failed"
    exit 1;
fi
docker container rm -f fastapi-test-deploy

docker run -d -p 80:80 --name fastapi-prod-deploy fastapi --restart=always
