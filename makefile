PHONY: dind-ci bulid deploy

# run dind-ci
dind-ci:
	@echo ---
	@echo ${OPENAI_API_KEY}
	@echo ---
	./bin/dind-ci.sh ${OPENAI_API_KEY}
	
# build image
build:
	docker build -t fastapi app/

# test and deploy
deploy:
	./bin/deploy.sh ${OPENAI_API_KEY}