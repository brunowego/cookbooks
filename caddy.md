# Caddy

## Docker

### Volume

```sh
docker volume create caddy-data
```

### Build

```sh
cat << 'EOF' | docker build $(echo $DOCKER_BUILD_OPTS) -t caddy:1.0.0 -
FROM docker.io/golang:1.12-alpine

RUN wget -O - https://github.com/mholt/caddy/releases/download/v1.0.0/caddy_v1.0.0_linux_amd64.tar.gz | \
    tar -xzC /usr/local/bin caddy

RUN echo -e '\
:80 {\n\
  root /var/www/html\n\
  browse\n\
}\n\
' > /etc/Caddyfile

ENTRYPOINT ["/usr/local/bin/caddy", "-conf", "/etc/Caddyfile"]

EOF
```

### Running

```sh
docker run -d \
  $(echo $DOCKER_RUN_OPTS) \
  -h caddy \
  -v /Users/brunowego/Cookbooks:/var/www/html \
  -p 8080:80 \
  --name caddy \
  caddy:1.0.0
```

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):8080"
```

### Remove

```sh
docker rm -f caddy
docker volume rm caddy-data
```

## Installation

### Homebrew

```sh
brew install caddy
```

### YUM

```sh
sudo yum check-update
sudo yum -y install epel-release
sudo yum -y install caddy
```

### Chocolatey

```sh
choco install -y caddy
```

## Configuration

### Homebrew

```sh
/usr/libexec/PlistBuddy -c 'Print :ProgramArguments' "$(brew --prefix caddy)"/homebrew.mxcl.caddy.plist
```

```sh
sudo mkdir -p /var/www/html
```

```sh
sudo tee -a /usr/local/etc/Caddyfile << EOF
:80 {
  root /var/www/html
  browse
}
EOF
```

## Service

### Homebrew

```sh
brew services start caddy
```

### systemd

```sh
sudo systemctl enable --now caddy
```
