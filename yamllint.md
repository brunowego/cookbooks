# yamllint

## Links

- [Code Repository](https://github.com/adrienverge/yamllint)
- [Main Website](https://yamllint.readthedocs.io/en/stable/index.html)

## Docker

### Build

```sh
cat << EOF | docker build $(echo $DOCKER_BUILD_OPTS) -t example/yamllint -
FROM docker.io/alpine:3.9

RUN apk add -q --no-cache py3-setuptools==40.6.3-r0

RUN pip3 install --no-cache-dir \
      yamllint===1.16.0

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

## CLI

### Installation

#### Darwin

```sh
brew install yamllint
```

#### APT

```sh
sudo apt update
sudo apt -y install yamllint
```

#### pip

```sh
pip3 install -U yamllint
```

### Commands

```sh
yamllint -h
```

### Configuration

```sh
cat << EOF > ./.yamllint.yaml
---
extends: default
ignore: |
  **/node_modules/**/*
  **/vendor/**
rules:
  indentation:
    spaces: 2
    indent-sequences: consistent
  quoted-strings:
    quote-type: single
    required: only-when-needed
  truthy:
    allowed-values: ['true', 'false', 'yes', 'no']
EOF
```

### Usage

```sh
#
yamllint ./
```

### Tips

#### Ignore

```yaml
# yamllint disable-line rule:truthy
# ...
```

#### Visual Studio Code

```sh
code --install-extension fnando.linter
```
