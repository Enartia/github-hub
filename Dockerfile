FROM golang:alpine3.14 as builder

ARG HUB_VERSION

WORKDIR /tmp

RUN mkdir -p /tmp/hub-source \
    && apk add --no-cache bash \
    && apk add --no-cache curl \
    && curl -L https://github.com/github/hub/archive/refs/tags/v$HUB_VERSION.tar.gz | tar xz -C /tmp/hub-source --strip 1 \
    && cd /tmp/hub-source/ \
    && ./script/build -o bin/hub

FROM alpine:3.14

RUN apk add --no-cache git

COPY --from=builder /tmp/hub-source/bin/hub /usr/local/bin/hub