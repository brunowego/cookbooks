# mkcert

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
sudo install -dm 755 -o "$USER" -g staff /etc/ssl/certs/example.com
mkdir -p /etc/ssl/certs/example.com/{ca,server,client}
```

```sh
CAROOT=/etc/ssl/certs/example.com/ca \
  mkcert -install
```

```sh
CAROOT=/etc/ssl/certs/example.com/ca \
  mkcert \
    -cert-file /etc/ssl/certs/example.com/server/server.pem \
    -key-file /etc/ssl/certs/example.com/server/server.key \
    example.com \
    '*.example.com' \
    $(ip route get 1 | awk '{print $NF;exit}') \
    localhost \
    127.0.0.1 \
    ::1
```

<!-- ```sh
CAROOT=/etc/ssl/certs/example.com/ca \
  mkcert \
    -client \
    -cert-file /etc/ssl/certs/example.com/client/client.pem \
    -key-file /etc/ssl/certs/example.com/client/client.key \
    nameUser1
``` -->

```sh
sudo hostess add app.example.com 127.0.0.1

caddy -conf <(cat << EOF
  app.example.com
  root /var/www/html
  tls /etc/ssl/certs/example.com/server/server.pem /etc/ssl/certs/example.com/server/server.key
EOF
)

docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h curl \
  -v /etc/ssl/certs/example.com:/etc/ssl/certs/example.com \
  --add-host app.example.com:"$(ip route get 1 | awk '{print $NF;exit}')" \
  --name curl \
  docker.io/curlimages/curl:7.67.0 \
    --cacert /etc/ssl/certs/example.com/ca/rootCA.pem \
    --cert /etc/ssl/certs/example.com/client/client.pem \
    --key /etc/ssl/certs/example.com/client/client.key \
    -v \
    https://app.example.com:2015
```

> **Darwin**: Prefix `/etc/ssl/certs/example.com` with `/private`.
