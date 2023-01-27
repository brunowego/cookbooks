# Secrets OPerationS (SOPS)

## Links

- [Code Repository](https://github.com/mozilla/sops)

## CLI

### Installation

#### Homebrew

```sh
brew install sops
```

### Commands

```sh
sops -h
```

### Usage

```sh
#
sops \
  -e \
  --input-type json \
  --output-type json \
  ghcr.dockerconfigjson \
    > ./ghcr.dockerconfigjson.encrypted
```
