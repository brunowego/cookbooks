# Docker

<!--
./.docker

DOCKER_REGISTRY:
DOCKER_REPOSITORY:
DOCKER_TAG:
-->

## Alternatives

- OpenVZ
- LXC

## References

- [Wiki](<https://en.wikipedia.org/wiki/Docker_(software)>)
- [Release Notes](https://docs.docker.com/engine/release-notes/)
  - [Prior Releases](https://docs.docker.com/engine/release-notes/prior-releases/)

## Tips

### Visual Studio Code

```sh
code --install-extension ms-azuretools.vscode-docker
```

```sh
# Darwin
osascript -e 'quit app "Visual Studio Code"'

code --disable-extension ms-azuretools.vscode-docker
```

### Here document (heredoc)

```sh
docker exec -i [container-name] /bin/sh << EOSHELL

EOSHELL
```
