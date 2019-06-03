# Minisign

- [Usage](https://jedisct1.github.io/minisign/#usage)

## Installation

### Homebrew

```sh
brew install minisign
```

## Docker

### Build

```sh
cat << 'EOF' | docker build $(echo $DOCKER_BUILD_OPTS) -t minisign:0.8 -
FROM alpine:3.9 as build

WORKDIR /usr/src/minisign

RUN apk add --no-cache cmake make g++ libsodium-dev

RUN wget -O - https://github.com/jedisct1/minisign/archive/0.8.tar.gz | tar -xz --strip-components 1 && \
    mkdir build && cd build && \
    cmake .. && \
    make && make install


FROM alpine:3.9

RUN apk add --no-cache libsodium-dev

COPY --from=build /usr/local/bin/minisign /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/minisign"]

EOF
```

### Running

```sh
docker run -it --rm minisign:0.8 -h
```

## Commands

```sh
minisign
```
