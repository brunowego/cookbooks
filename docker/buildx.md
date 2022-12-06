# Docker Buildx

## CLI

### Commands

```sh
docker buildx --help
```

### Usage

```sh
#
docker buildx create --name [name]

#
docker buildx use [name]

#
docker buildx inspect [name]
docker buildx inspect [name] --bootstrap

#
docker buildx build \
  --platform linux/arm65,linux/amd64 \
  -t [image] \
  --push \
  ./
```
