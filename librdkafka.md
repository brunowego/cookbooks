# Library Rapid Development Kafka (a.k.a librdkafka)

## Links

- [Code Repository](https://github.com/edenhill/librdkafka)

## Installation

### Homebrew

```sh
brew install librdkafka
```

### APT

```sh
sudo apt update
sudo apt -y install librdkafka-dev
```

### YUM

```sh
cat << EOF | sudo tee /etc/yum.repos.d/confluent.repo
[Confluent]
name=Confluent repository
baseurl=https://packages.confluent.io/rpm/5.4/7
gpgkey=https://packages.confluent.io/rpm/5.4/archive.key
EOF

yum check-update
sudo yum -y install librdkafka-devel
```

### APK

```sh
apk update
apk add librdkafka-dev
```

### Source Code

#### Dependencies

##### Zypper

```sh
sudo zypper refresh
sudo zypper install -y git-core make gcc-c++ cyrus-sasl-devel
```

##### YUM

```sh
yum check-update
sudo yum -y install git make gcc-c++ zlib-devel cyrus-sasl-devel
```

##### APT

```sh
sudo apt update
sudo apt -y install git make g++ zlib1g-dev libsasl2-dev
```

##### APK

```sh
sudo apk update
sudo apk add git bash make g++ zlib-dev cyrus-sasl-dev
```

#### Build & Install

```sh
git clone --branch v1.0.0-test1 --single-branch --depth 1 https://github.com/edenhill/librdkafka.git
( cd ./librdkafka && ./configure --prefix /usr/local/librdkafka && make && sudo make install )
```

```sh
( cd ./librdkafka && examples/rdkafka_example -X builtin.features ) && rm -fR ./librdkafka
```

```sh
sudo /usr/bin/sh -c 'echo "/usr/local/librdkafka/lib" >> /etc/ld.so.conf.d/librdkafka.conf'
```

```sh
sudo ldconfig
```
