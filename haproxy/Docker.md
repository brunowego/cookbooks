# Docker

## Running

```sh
sudo mkdir -p /opt/haproxy
```

```sh
touch /opt/haproxy/haproxy.cfg || exit
```

```sh
docker run -d \
  -h haproxy \
  -v /opt/haproxy:/usr/local/etc/haproxy:ro
  --name haproxy \
  --restart always \
  haproxy:latest
```

## Remove

```sh
docker rm -f haproxy
```
