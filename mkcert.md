# mkcert

**Keywords:** Locally-Trusted Certificate, Self-Signed Certificate

## Links

- [Main Website](https://github.com/FiloSottile/mkcert)

## CLI

### Installation

#### Homebrew

```sh
brew install mkcert

# If you use Firefox
brew install nss
```

#### APT

```sh
sudo apt update
sudo apt -y install libnss3-tools
```

#### YUM

```sh
yum check-update
sudo yum -y install nss-tools
```

#### Zypper

```sh
sudo zypper refresh
sudo zypper install -y mozilla-nss-tools
```

#### Chocolatey

```sh
choco install mkcert
```

### Commands

```sh
mkcert -help
```

### Configuration

```sh
# Darwin
sudo install -dm 755 -o "$USER" -g staff /etc/ssl/certs/domain.tld

# Linux
sudo install -dm 755 -o "$USER" -g staff /etc/ssl/certs/domain.tld

#
mkdir -p /etc/ssl/certs/domain.tld/{ca,server,client}

#
CAROOT=/etc/ssl/certs/domain.tld/ca \
  mkcert -install

#
CAROOT=/etc/ssl/certs/domain.tld/ca \
  mkcert \
    -cert-file /etc/ssl/certs/domain.tld/server/server.pem \
    -key-file /etc/ssl/certs/domain.tld/server/server.key \
    domain.tld \
    '*.domain.tld' \
    $(ip route get 1 | awk '{print $NF;exit}') \
    localhost \
    127.0.0.1 \
    ::1
```

```sh
sudo hostess add app.domain.tld 127.0.0.1
```

### Tips

#### http-server

```sh
http-server \
  -S \
  -C /etc/ssl/certs/domain.tld/server/server.pem \
  -K /etc/ssl/certs/domain.tld/server/server.key
```

<!-- #### mitmproxy

```sh
mitmdump \
  -p 443 \
  --mode reverse:http://127.0.0.1:8000 \
  --no-http2 \
  --certs /etc/ssl/certs/domain.tld/server/server.pem
``` -->

#### Caddy

```sh
caddy -conf <(cat << EOF
  app.domain.tld
  root /var/www/html
  tls /etc/ssl/certs/domain.tld/server/server.pem /etc/ssl/certs/domain.tld/server/server.key
EOF
)
```

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h curl \
  -v /etc/ssl/certs/domain.tld:/etc/ssl/certs/domain.tld \
  --add-host app.domain.tld:"$(ip route get 1 | awk '{print $NF;exit}')" \
  --name curl \
  docker.io/curlimages/curl:7.67.0 \
    --cacert /etc/ssl/certs/domain.tld/ca/rootCA.pem \
    --cert /etc/ssl/certs/domain.tld/client/client.pem \
    --key /etc/ssl/certs/domain.tld/client/client.key \
    -v \
    https://app.domain.tld:2015
```
