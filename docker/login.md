# Docker Login

## Credential Helper

### Installation

#### Homebrew

```sh
brew install docker-credential-helper
```

### Configuration

#### Homebrew

```sh
#
mkdir -p ~/.docker

#
[[ -f ~/.docker/config.json ]] || echo '{}' >> ~/.docker/config.json

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
