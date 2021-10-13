# Thanos

<!--
thanosrulers

https://particule.io/en/blog/thanos-monitoring/
https://stackoverflow.com/questions/64965827/unable-to-attach-aws-ebs-volume-error-instance-not-found
-->

## Links

- [Main Website](https://thanos.io/)
- [Code Repository](https://github.com/thanos-io/thanos)

## CLI

### Installation

#### Homebrew

```sh
brew install thanos
```

### Commands

```sh
thanos -h
```

<!-- ### Usage

```sh
#
thanos receive \
  --receive.hashrings-file=./test/config/hashrings.json \
  --receive.local-endpoint=127.0.0.1:10901 \
  --receive.default-tenant-id="1610b0c3-c509-4592-a256-a1871353dbfa" \
  --grpc-address=127.0.0.1:10901 \
  --http-address=127.0.0.1:10902 \
  --remote-write.address=127.0.0.1:19291 \
  --log.level=error \
  --tsdb.path="$(mktemp -d)"

#
thanos query \
  --grpc-address=127.0.0.1:10911 \
  --http-address=127.0.0.1:9091 \
  --store=127.0.0.1:10901 \
  --log.level=error \
  --web.external-prefix=.
``` -->
