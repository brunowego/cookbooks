# Docker

<!--
Released 2013
-->

<!--
./.docker

DOCKER_REGISTRY:
DOCKER_REPOSITORY:
DOCKER_TAG:
-->

<!--
host.docker.internal
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
#
code --install-extension ms-azuretools.vscode-docker

#
jq '."recommendations" += ["ms-azuretools.vscode-docker"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

**Configuration:**

```sh
jq '."[dockerfile]"."editor.defaultFormatter" |= "ms-azuretools.vscode-docker"' "$PWD"/.vscode/settings.json | sponge "$PWD"/.vscode/settings.json
```

### Here document (heredoc)

```sh
docker exec -i <container-name> /bin/sh << EOSHELL

EOSHELL
```
