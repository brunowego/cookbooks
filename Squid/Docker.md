# Docker

## Build

```sh
cat << 'EOF' | docker build -t squid  -
FROM alpine:3.9

RUN apk add --no-cache squid

EXPOSE 3128

CMD ["/usr/sbin/squid", "-Nd", "1"]
EOF
```

## Running

```sh
docker run -d \
  -h squid \
  -p 3128:3128 \
  --name squid \
  --restart always \
  squid:latest
```

```sh
docker exec -i squid /bin/sh << 'EOSHELL'
cat << 'EOF' >> /etc/squid/squid.conf
cache_peer 127.0.0.1 parent 8443 0 no-query no-digest no-netdb-exchange default login=[username]:[password]

EOF
EOSHELL
```

```sh
docker restart squid
```

## Remove

```sh
docker rm -f squid
```
