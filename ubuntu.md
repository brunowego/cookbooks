# Ubuntu

## Derivative

- [Ubuntu MATE](https://ubuntu-mate.org/)
- [Lubuntu](https://lubuntu.net/)

## Docker

### Running

```sh
docker run -it --rm \
  $(echo $DOCKER_RUN_OPTS) \
  -h ubuntu \
  --name ubuntu \
  ubuntu:18.04 /bin/bash
```

## Tips

### Setting Default Editor

```sh
sudo update-alternatives --config editor
```
