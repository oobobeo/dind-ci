PHONY: bulid deploy

REPO = gkstmdok

# build app
build:
	@echo "building..."
	docker build -t ${REPO}:fastapi .

# test and deploy app
deploy:
	@echo "deploying..."
	@bin/deploy.sh ${OPENAI_API_KEY} ${REPO}
