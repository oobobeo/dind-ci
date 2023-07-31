PHONY: bulid deploy

REPO = gkstmdok

# build app
build:
	docker build -t ${REPO}:fastapi .

# test and deploy app
deploy:
	bin/deploy.sh ${OPENAI_API_KEY} ${REPO}
