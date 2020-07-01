# cURL

## Docker

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h curl \
  --name curl \
  docker.io/curlimages/curl:7.67.0 -h
```

## CLI

### Installation

#### Homebrew

```sh
brew install curl
```

#### APT

```sh
sudo apt update
sudo apt -y install curl
```

#### YUM

```sh
yum check-update
sudo yum -y install curl
```

#### APK

```sh
sudo apk update
sudo apk add curl
```

#### Source

##### Dependencies

###### APT

```sh
sudo apt update
sudo apt -y install wget g++ libssl-dev make
```

###### YUM

```sh
yum check-update
sudo yum -y install wget gcc-c++ openssl-devel make
```

##### Build & Install

```sh
wget -O - https://curl.haxx.se/download/curl-7.62.0.tar.gz | tar -xz
( cd ./curl-7.62.0 && ./configure --disable-shared --disable-dependency-tracking && make && sudo make install )
```

#### Chocolatey

```sh
choco install -y curl
```

### Commands

```sh
curl -h
```

### Usage

#### Insecure SSL

```sh
curl -Ik https://[hostname]
```

```sh
curl -Ik \
  --resolve [hostname]:[ip] \
  https://[hostname]
```

### Tips

#### Proxy

```sh
tee -a ~/.curlrc << EOF
HTTP_PROXY=$http_proxy
HTTPS_PROXY=$https_proxy
NO_PROXY=$no_proxy
http_proxy=$http_proxy
https_proxy=$https_proxy
no_proxy=$no_proxy
EOF
```

#### SSL Support

```sh
# Linux
ldd `which curl` | grep -E '(ssl|crypto)'

# Darwin
TODO
```

### Issues

<!-- ####

```log
```

```sh
#
curl https://api.joind.in/v2.1/

#
php -r 'print_r(openssl_get_cert_locations());'
```

1. Help
2. SSL Proxying
3. Save Charles Root Certificate...

```sh
#
cat ./charles-ssl-proxying-certificate.pem >> /usr/local/etc/openssl/cert.pem

cat ./charles-ssl-proxying-certificate.pem >> /usr/local/etc/openssl@1.1/cert.pem
``` -->

#### Insecure

```log
curl: (60) SSL certificate problem: self signed certificate in certificate chain
More details here: https://curl.haxx.se/docs/sslcerts.html

curl failed to verify the legitimacy of the server and therefore could not
establish a secure connection to it. To learn more about this situation and
how to fix it, please visit the web page mentioned above.
```

```sh
echo 'insecure' >> ~/.curlrc
```

<!-- ####

```log
```

```sh
sudo wget -O /etc/ssl/cacert.pem http://curl.haxx.se/ca/cacert.pem
sudo mv /etc/ssl/cert.pem /etc/ssl/cert.pem.bkp
sudo mv /etc/ssl/cacert.pem /etc/ssl/cert.pem
``` -->

<!-- ####

```log
curl: (35) OpenSSL SSL_connect: SSL_ERROR_SYSCALL in connection to [domain]:443
```

```sh
openssl s_client -connect [domain]:443
``` -->
