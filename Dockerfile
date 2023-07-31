FROM docker:24.0.5-dind

WORKDIR ci

ARG OPENAI_API_KEY
ENV OPENAI_API_KEY $OPENAI_API_KEY

COPY ./FastAPI ./FastAPI
COPY bin ./bin
COPY makefile .

RUN apk add \
    bash \
    git \
    make \
    python3
