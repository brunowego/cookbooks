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
cat << EOF | docker build $(echo $DOCKER_BUILD_OPTS) -t minisign:0.8 -
FROM docker.io/alpine:3.9 AS build

WORKDIR /usr/src/minisign

RUN apk add -q --no-cache \
    bash==4.4.19-r1 \
    cmake==3.13.0-r0 \
    make==4.2.1-r2 \
    g++==8.3.0-r0 \
    libsodium-dev==1.0.16-r0

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN wget -O - 'https://github.com/jedisct1/minisign/archive/0.8.tar.gz' | tar -xz --strip-components 1 && \
    gcc -static -Os -s -o minisign src/*.c -lsodium

# ---

FROM docker.io/scratch

COPY --from=build /usr/src/minisign/minisign /usr/local/bin/

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
