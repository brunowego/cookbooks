# Docker

## Build

```sh
cat << EOF | docker build -t openssh-client -
FROM alpine:3.9

RUN apk add --no-cache openssh-client

ENTRYPOINT ["/usr/bin/ssh"]
EOF
```

## Running

```sh
docker run -it --rm \
  --name openssh-client \
  openssh-client:latest $(whoami)@$(ip route get 1 | awk '{print $NF;exit}')
```
