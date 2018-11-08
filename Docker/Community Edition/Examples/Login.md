# Login

## Credential Helper

### Installation

#### Homebrew

```sh
brew install docker-credential-helper
```

### Configuration

#### Homebrew

```sh
jq ".credsStore |= \"osxkeychain\"" ~/.docker/config.json | sponge ~/.docker/config.json
```

## Login

```sh
docker login
```
