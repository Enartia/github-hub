FROM golang:alpine@sha256:c8cbfe53dae2363fa89a7359bdf2d2e7a82239ea36fe8ea5444cc365983331e6 as builder

ARG HUB_VERSION

WORKDIR /tmp

RUN mkdir -p /tmp/hub-source \
    && apk add --no-cache bash \
    && apk add --no-cache curl \
    && curl -L https://github.com/github/hub/archive/refs/tags/v$HUB_VERSION.tar.gz | tar xz -C /tmp/hub-source --strip 1 \
    && cd /tmp/hub-source/ \
    && ./script/build -o bin/hub

FROM alpine@sha256:1775bebec23e1f3ce486989bfc9ff3c4e951690df84aa9f926497d82f2ffca9d

RUN apk add --no-cache git

COPY --from=builder /tmp/hub-source/bin/hub /usr/local/bin/hub