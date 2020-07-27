FROM alpine:3.12.0 as builder

RUN apk add --no-cache --virtual build-dependencies \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    git \
    build-base \
    python2 \
    re2c

RUN git clone --depth 1 https://github.com/ninja-build/ninja.git /opt/ninja

WORKDIR /opt/ninja

RUN ./configure.py --bootstrap --host=linux --platform=linux

FROM alpine:3.12.0

COPY --from=builder /opt/ninja/ /opt/ninja/

ENV PATH $PATH:/opt/ninja/

