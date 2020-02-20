# Micro

<!--
https://github.com/micro-in-cn/starter-kit
-->

## References

- [Micro Toolkit](https://micro.mu/docs/toolkit.html)

## Docker

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h micro \
  --name micro \
  docker.io/microhq/micro:latest -h
```

## CLI

### Requirements

- [Protocol Buffers](/protobuf.md)

### Dependencies

```sh
GO111MODULE=on go get github.com/micro/protoc-gen-micro
```

### Installation

```sh
GO111MODULE=on go get github.com/micro/micro
```

### Commands

```sh
micro -h
```
