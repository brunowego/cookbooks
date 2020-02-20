# Python 2

## Docker

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h python \
  --name python \
  docker.io/library/python:2.7 /bin/bash
```

## Installation

### Homebrew

```sh
brew install python@2
```

### YUM

```sh
yum check-update
sudo yum -y install python2
```

### APT

```sh
sudo apt update
sudo apt -y install python2.7
```

### APK

```sh
sudo apk update
sudo apk add python2
```

### Source

#### Dependencies

### YUM

```sh
yum check-update
sudo yum -y install gcc-c++ make zlib-devel libffi-devel openssl-devel bzip2-devel readline-devel sqlite-devel
```

#### Build & Install

```sh
curl https://www.python.org/ftp/python/2.7.16/Python-2.7.16.tgz | tar -zx
( cd ./Python-2.7.16 && ./configure --prefix /usr/local/lib/python2 --with-threads --enable-shared && make && sudo make altinstall ) && rm -fR ./Python-2.7.16
```

```sh
sudo /usr/bin/sh -c 'echo "/usr/local/lib/python2" >> /etc/ld.so.conf.d/python2.conf'
```

```sh
sudo ldconfig
```

## Commands

```sh
python2 -h
```

## REPL

```sh
python2
```
