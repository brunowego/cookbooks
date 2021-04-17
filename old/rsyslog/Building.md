# Building

## Dependencies

### YUM

```sh
yum check-update
sudo yum -y install wget autoconf libtool libestr-devel zlib-devel libuuid-devel libgcrypt-devel libcurl-devel
```

```sh
LIBFASTJSON_CFLAGS="-I/usr/include/libfastjson" \
 LIBFASTJSON_LIBS="-lfastjson" \
 ./configure
```

### APT

```sh
sudo apt update
sudo apt -y install wget autoconf libltdl-dev pkg-config libestr-dev zlib1g-dev uuid-dev libgcrypt11-dev libcurl3-dev
```

### Linux

```sh
wget -O - https://github.com/rsyslog/libfastjson/archive/v0.99.8.tar.gz | tar -xz
( cd ./libfastjson-0.99.8 && ./autogen.sh && ./configure && make && sudo make install ) && rm -r ./libfastjson-0.99.8
```

## Installation

```sh
wget -O - https://www.rsyslog.com/files/download/rsyslog/rsyslog-8.39.0.tar.gz | tar -xz
( cd ./rsyslog-8.39.0 && autoreconf -fvi && ./configure && make && sudo make install ) && rm -r ./rsyslog-8.39.0
```
