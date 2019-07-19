# cURL

## Installation

### Homebrew

```sh
brew install curl
```

### APT

```sh
sudo apt update
sudo apt -y install curl
```

### YUM

```sh
sudo yum check-update
sudo yum -y install curl
```

### APK

```sh
sudo apk update
sudo apk add curl
```

### Source

#### Dependencies

##### APT

```sh
sudo apt update
sudo apt -y install wget g++ libssl-dev make
```

##### YUM

```sh
sudo yum check-update
sudo yum -y install wget gcc-c++ openssl-devel make
```

#### Build & Install

```sh
wget -O - https://curl.haxx.se/download/curl-7.62.0.tar.gz | tar -xz
( cd curl-7.62.0 && ./configure --disable-shared --disable-dependency-tracking && make && sudo make install )
```

### Chocolatey

```sh
choco install -y curl
```

## Commands

```sh
curl -h
```

## Proxy

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
