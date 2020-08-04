FROM 0x01be/alpine:edge as builder

RUN apk add --no-cache --virtual ninja-build-dependencies \
    git \
    build-base \
    python2 \
    re2c

RUN git clone --depth 1 https://github.com/ninja-build/ninja.git /opt/ninja

WORKDIR /opt/ninja

RUN ./configure.py --bootstrap --host=linux --platform=linux

FROM 0x01be/alpine:edge

COPY --from=builder /opt/ninja/ /opt/ninja/

ENV PATH $PATH:/opt/ninja/

