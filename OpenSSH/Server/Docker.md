# Docker

## Build

```sh
cat << 'EOF' | docker build -t openssh-server -
FROM alpine:3.9

RUN apk add --no-cache openssh-server && \
    ssh-keygen -A

RUN echo 'root:Pa$$w0rd!' | chpasswd

RUN sed -i 's/^#PermitRootLogin .*/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
EOF
```

## Running

```sh
docker run -d \
  -h openssh-server \
  -p 2222:22 \
  --name openssh-server \
  --restart always \
  openssh-server:latest
```

```sh
ssh \
  -o UserKnownHostsFile=/dev/null \
  -o StrictHostKeyChecking=no \
  -p 2222 \
  root@$(docker-machine ip)
```

## Remove

```sh
docker rm -f openssh-server
```
