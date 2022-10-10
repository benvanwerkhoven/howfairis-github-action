FROM python:3.9-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache build-base bash git openssh

WORKDIR /data

RUN python3 -m venv venv            && \
    source venv/bin/activate        && \
    pip install --upgrade pip wheel && \
    pip install git+https://github.com/benvanwerkhoven/howfairis.git

ENV PATH=/data/venv/bin:${PATH}

ENTRYPOINT ["howfairis"]
