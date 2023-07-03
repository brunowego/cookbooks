# Docker Buildx

## Links

- [Code Repository](https://github.com/docker/buildx)

## CLI

### Commands

```sh
docker buildx --help
```

### Usage

```sh
#
docker buildx create --name <name>

#
docker buildx use <name>

#
docker buildx inspect <name>
docker buildx inspect <name> --bootstrap

#
docker buildx build \
  --platform linux/arm65,linux/amd64 \
  -t <image> \
  --push \
  ./
```

### Issues

#### TBD

```log
Error: buildx failed with: ERROR: failed to solve: cannot copy to non-directory: /var/lib/buildkit/runc-overlayfs/cachemounts/buildkit1564503718/app/apps/web/node_modules/@apollo/client
```

TODO
