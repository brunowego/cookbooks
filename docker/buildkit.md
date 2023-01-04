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

### Commands

```sh
buildctl -h
```

### Tips

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

<!--
export BUILDKIT_PROGRESS='plain'
export BUILDKIT_PROGRESS='tty'
-->
