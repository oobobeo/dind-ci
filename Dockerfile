FROM docker:24.0.5-dind

ARG OPENAI_API_KEY

COPY ./FastAPI .
