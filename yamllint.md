# YAMLlint

## Docker

### Build

```sh
cat << EOF | docker build $(echo $DOCKER_BUILD_OPTS) -t example/yamllint -
FROM docker.io/alpine:3.9

RUN apk add -q --no-cache py3-setuptools==40.6.3-r0

RUN pip3 install --no-cache-dir yamllint===1.16.0

ENTRYPOINT ["/usr/bin/yamllint"]

EOF
```

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h yamllint \
  --name yamllint \
  example/yamllint:latest -h
```

## Installation

### Darwin

```sh
brew install yamllint
```

### APT

```sh
sudo apt update
sudo apt -y install yamllint
```

### PIP

```sh
pip install -U yamllint
```

## Commands

```sh
yamllint -h
```
