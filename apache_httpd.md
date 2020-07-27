# Apache HTTP Server (HTTPd)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h httpd \
  -v httpd-config:/usr/local/apache2/conf \
  -p 8080:80 \
  --name httpd \
  --network workbench \
  docker.io/library/httpd:2.4-alpine
```

### Reverse Proxy

```sh
docker exec -i httpd /bin/sh << \EOSHELL
sed -i '/proxy_module/ s/^#//; /proxy_http_module/ s/^#//; /rewrite_module/ s/^#//' ./conf/httpd.conf

cat << EOF >> ./conf/httpd.conf
ProxyPass / http://docker.for.mac.localhost:8080/
ProxyPassReverse / http://docker.for.mac.localhost:8080/
EOF
EOSHELL
```

```sh
docker restart httpd
```

### Remove

```sh
docker rm -f httpd
```

## CLI

### Dependencies

```sh
# Stop built in Apache (Linux/Darwin)
sudo apachectl stop

# Darwin
sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist

# Linux
sudo systemctl disable --now httpd
```

### Installation

#### Homebrew

```sh
brew install httpd24
```

#### APT

```sh
sudo apt update
sudo apt -y install apache2
```

#### YUM

```sh
yum check-update
sudo yum -y install httpd
```

#### Source

##### Dependencies

- [Apache Portable Runtime](/apache_apr.md)

###### YUM

```sh
yum check-update
sudo yum -y install wget gcc make pcre-devel expat-devel
```

##### Build & Install

```sh
wget -O - https://archive.apache.org/dist/httpd/httpd-2.4.41.tar.gz | tar -xz
( cd ./httpd-2.4.41 && ./configure --with-apr=/usr/local/apr --with-apr-util=/usr/local/apr --prefix=/usr/local/apache && make && sudo make install ) && rm -r ./httpd-2.4.41
```

### Configuration

```sh
ps -ef | grep apache

/usr/sbin/httpd -V | grep HTTPD_ROOT
/usr/sbin/httpd -V | grep SERVER_CONFIG_FILE
```

```sh
# Check
id apache

# Linux
sudo useradd -d /usr/share/httpd -rs /sbin/nologin apache
sudo usermod -aG apache "$USER" && sudo su - "$USER"
```

```sh
# Linux
sudo mkdir -m 755 -p /var/www && sudo chown -R apache: "$_"
```

### Services

```sh
# Homebrew
brew services start httpd

# or
apachectl start

# Systemd
sudo systemctl enable --now httpd
```

### Tips

<!-- ####

```sh
httpd -f <(cat << EOF
Listen 8000
EOF
) \
  -DFOREGROUND
``` -->

#### PHP-FPM

```sh
# Test
cgi-fcgi -bind -connect '127.0.0.1:9000'

# Linux
## Add ping/status page
cat << EOF | sudo tee -a /etc/httpd/conf.d/php.conf
<FilesMatch "^ping|status$">
    RewriteEngine Off
    SetHandler "proxy:fcgi://127.0.0.1:9000"
</FilesMatch>

EOF

# Darwin
## Enable modules
sed -i '/proxy_module/ s/^#//; /proxy_fcgi_module/ s/^#//; /rewrite_module/ s/^#//' /usr/local/etc/httpd/httpd.conf

## Add ping/status page
cat << EOF >> /usr/local/etc/httpd/httpd.conf
<FilesMatch "^ping|status$">
    RewriteEngine Off
    SetHandler "proxy:fcgi://127.0.0.1:9000"
</FilesMatch>

EOF
```

```sh
# Test
httpd -t

# Homebrew
brew services restart httpd

# Linux
sudo systemctl restart httpd
```

### Uninstall

```sh
# Homebrew
brew services stop httpd
brew uninstall httpd24
rm -fR /usr/local/etc/httpd

# Fresh install? Check for files below!
# /usr/local/var/cache/httpd
# /usr/local/var/log/httpd
# /usr/local/var/run/httpd
# /usr/local/lib/httpd
# /usr/share/httpd
# /Library/WebServer/share/httpd
```
