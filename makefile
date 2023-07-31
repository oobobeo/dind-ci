PHONY: up

# run dind-ci
up:
	@echo ---
	@echo ${OPENAI_API_KEY}
	@echo ---
	./bin/dind-ci.sh ${OPENAI_API_KEY}
