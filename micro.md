# Micro

## References

- [Micro Toolkit](https://micro.mu/docs/toolkit.html)

## Docker

### Running

```sh
docker run -it --rm \
  $(echo $DOCKER_RUN_OPTS) \
  -h micro \
  --name micro \
  microhq/micro:latest -h
```

## Installation

```sh
go get -u github.com/micro/micro
go get -u github.com/micro/protoc-gen-micro
```

## Commands

```sh
micro -h
```
