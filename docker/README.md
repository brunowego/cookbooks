# Docker

<!--
./.docker
-->

## Alternatives

- OpenVZ
- LXC

## References

- [Wiki](https://en.wikipedia.org/wiki/Docker_(software))
- [Release Notes](https://docs.docker.com/engine/release-notes/)
  - [Prior Releases](https://docs.docker.com/engine/release-notes/prior-releases/)

<!--
## Interview

https://www.youtube.com/watch?v=v9yu1uIYuoA
https://www.youtube.com/watch?v=-BW0Kk5Vj7o
-->

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
