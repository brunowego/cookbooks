# Docker

## Build

```sh
cat << 'EOF' | docker build -t stunnel  -
FROM alpine:3.9

ENV http_proxy=${http_proxy} \
    https_proxy=${https_proxy} \
    no_proxy=${no_proxy}

RUN apk add --no-cache stunnel && \
    mkdir /etc/stunnel/conf.d && \
    echo -e '\ninclude = /etc/stunnel/conf.d'

EXPOSE 8443

CMD ["/usr/bin/stunnel"]
EOF
```

## Running

```sh
docker run -d \
  -h stunnel \
  -p 8443:8443 \
  --name stunnel \
  --restart always \
  stunnel:latest
```

```sh
docker exec -i stunnel /bin/sh << 'EOSHELL'
cat << 'EOF' >> /etc/stunnel/conf.d/https.conf
[https]
client = yes
accept = 8443
connect = [hostname]:443
verify = 2
CAfile = /etc/ssl/certs/stunnel.pem
TIMEOUTclose = 300
TIMEOUTidle = 30

EOF
EOSHELL
```

```sh
docker restart stunnel
```

## Remove

```sh
docker rm -f stunnel
```
