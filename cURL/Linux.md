# Linux

## Installation

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

##### YUM

```sh
sudo yum check-update
sudo yum -y install gcc-c++ openssl-devel zlib-devel
```

#### Build & Install

```sh
wget -O - https://curl.haxx.se/download/curl-7.62.0.tar.gz | tar -xz
( cd curl-7.62.0 && ./configure --disable-shared && make && sudo make install )
```
