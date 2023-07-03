# BuildKit

<!--
https://devopsspiral.com/articles/containers/modernize-image-builds/
-->

## Links

- [Code Repository](https://github.com/moby/buildkit)

## CLI

### Installation

#### Homebrew

```sh
brew install buildkit
```

## Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# BuildKit
export BUILDKIT_PROGRESS='plain'
```

```sh
sudo su - "$USER"
```

### Commands

```sh
buildctl -h
```

### Tips

#### Disable BuildKit

> DEPRECATED: The legacy builder is deprecated and will be removed in a future release. BuildKit is currently disabled; enable it by removing the DOCKER_BUILDKIT=0 environment-variable.

```sh
export DOCKER_BUILDKIT=0
```

#### Remove Feature

```sh
#
jq 'del(.features.buildkit)' ~/.docker/daemon.json | sponge ~/.docker/daemon.json
```

```sh
# Darwin
osascript -e 'quit app "Docker"'
open -a Docker

# Systemd
sudo systemctl restart docker
```

<!--
docker info | grep Proxy
-->
