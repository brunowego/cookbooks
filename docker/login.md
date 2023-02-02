# Docker Login

## Credential Helper

### Links

- [Code Repository](https://github.com/docker/docker-credential-helpers)

### Installation

#### Homebrew

```sh
brew install docker-credential-helper
```

### Commands

```sh
docker-credential-desktop -h
```

### Usage

```sh
#
docker-credential-desktop list

#
docker-credential-ecr-login list

#
docker-credential-osxkeychain list
```

<!--
docker-credential-gcloud
-->

### Configuration

#### Homebrew

```sh
#
jq ".credsStore |= \"osxkeychain\"" ~/.docker/config.json | sponge ~/.docker/config.json
```

## Server

> Configure insecure registry.

```sh
#
jq 'del(.credsStore)' ~/.docker/config.json | sponge ~/.docker/config.json

#
docker login \
  -u <username> \
  <hostname>:5000
```
