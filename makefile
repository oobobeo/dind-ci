PHONY: up

# run dind-ci
up:
	@echo "running dind-ci..."
	@./bin/dind-ci.sh ${OPENAI_API_KEY}
