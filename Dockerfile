FROM 0x01be/base as build

WORKDIR /opt/ninja

RUN apk add --no-cache --virtual ninja-build-dependencies \
    git \
    build-base \
    python2 \
    re2c &&\
    git clone --depth 1 https://github.com/ninja-build/ninja.git /opt/ninja
RUN ./configure.py --bootstrap --host=linux --platform=linux

ENV PATH=${PATH}:/opt/ninja/

