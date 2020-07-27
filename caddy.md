# Caddy

## Docker

### Build

```sh
cat << \EOF | docker build $(echo $DOCKER_BUILD_OPTS) -t caddy:1.0.0 -
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
  $(echo "$DOCKER_RUN_OPTS") \
  -h caddy \
  -v $USER/Cookbooks:/var/www/html \
  -p 8080:80 \
  --name caddy \
  caddy:1.0.0
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```sh
docker rm -f caddy
docker volume rm caddy-data
```

## CLI

### References

- [TLS](https://caddyserver.com/v1/docs/tls)
- [Proxy](https://caddyserver.com/v1/docs/proxy)
- [FastCGI](https://caddyserver.com/v1/docs/fastcgi)
- [COS](https://caddyserver.com/v1/docs/http.cors)
- [Basic Auth](https://caddyserver.com/v1/docs/basicauth)
- [Reverse Proxy](https://caddyserver.com/docs/quick-starts/reverse-proxy)

### Installation

#### Homebrew

```sh
brew install caddy
```

#### YUM

```sh
yum check-update

# Repo: EPEL
sudo yum -y install caddy
```

#### Chocolatey

```sh
choco install -y caddy
```

### Commands

```sh
caddy help
```

### Running

```sh
# Linux
caddy start

#
# sudo hostess add app.example.com 127.0.0.1

# caddy -conf <(cat << EOF
#   app.example.com
#   root /var/www/html
#   tls off
# EOF
# )

# SSL with Let's Encrypt
# caddy \
#   -agree \
#   -email admin@example.com \
#   -host app.example.com \
#   -root /var/www/html

# caddy reverse-proxy \
#   --from http://127.0.0.1:8080 \
#   --insecure \
#   --to 127.0.0.1:8081
```

<!-- ### Configuration

```sh
# Homebrew
/usr/libexec/PlistBuddy -c 'Print :ProgramArguments' "$(brew --prefix caddy)"/homebrew.mxcl.caddy.plist
sudo install -dm 775 -o "$USER" -g admin /var/www/html
sudo install -dm 775 -o root -g admin /var/log/caddy

##
sudo tee -a /usr/local/etc/Caddyfile << EOF
:8080 {
  root /var/www/html
  gzip
  browse
  log /var/log/caddy/access.log
  errors /var/log/caddy/error.log
}
EOF

##
sudo tee -a /usr/local/etc/Caddyfile << EOF
example.local:8443 {
  [...]
  tls self_signed
  # tls /etc/ssl/certs/example.com/server/server.pem /etc/ssl/certs/example.com/server/server.key
}
EOF

#
# :8000

# reverse_proxy 127.0.0.1:8080

# Linux

/etc/caddy/caddy.conf

sudo systemctl restart caddy
``` -->

### Service

```sh
# Homebrew
brew services start caddy

# Systemd
sudo systemctl enable --now caddy
```

### Tips

#### Visual Studio Code

```sh
code --install-extension zamerick.vscode-caddyfile-syntax
```

<!-- #### PHP-FPM

```sh
phpbrew fpm start
```

```sh
# Homebrew
caddy -conf <(cat << EOF
:8080 {
  root /var/www/html

  fastcgi / 127.0.0.1:9000 php {
    index index.php
  }

  gzip
}
EOF
)
``` -->

<!-- ### Logs

```sh
tail -f /var/log/caddy/access.log
tail -f /var/log/caddy/error.log
``` -->
