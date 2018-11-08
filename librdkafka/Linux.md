# Linux

## Dependencies

### Zypper

```sh
sudo zypper install -y git-core make gcc-c++ cyrus-sasl-devel
```

### YUM

```sh
sudo yum check-update
sudo yum -y install git make gcc-c++ zlib-devel cyrus-sasl-devel
```

### APT

```sh
sudo apt update
sudo apt -y install git make g++ zlib1g-dev libsasl2-dev
```

### APK

```sh
sudo apk update
sudo apk add git bash g++ zlib-dev cyrus-sasl-dev make
```

## Installation

```sh
git clone --branch v1.0.0-test1 --single-branch --depth 1 https://github.com/edenhill/librdkafka.git
( cd librdkafka && ./configure --prefix /usr/local/librdkafka && make && sudo make install )
```

```sh
( cd librdkafka && examples/rdkafka_example -X builtin.features ) && rm -fR librdkafka
```

```sh
sudo sh -c 'echo "/usr/local/librdkafka/lib" >> /etc/ld.so.conf.d/librdkafka.conf'
```

```sh
sudo ldconfig
```
