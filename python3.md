# Python 3

## References

- [Google Python Style Guide](https://google.github.io/styleguide/pyguide.html)

## Tools

- [Debug](/ipdb.md)

## Docker

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h python \
  --name python \
  docker.io/library/python:3.7 /bin/bash
```

## CLI

### Dependencies

- [CentOS Repo's](/centos.md#repositories)

### Installation

#### Homebrew

```sh
brew install python
```

#### YUM

```sh
yum check-update

# Repo: EPEL
sudo yum -y install python36
```

#### APT

```sh
sudo apt update
sudo apt -y install python3
```

#### APK

```sh
sudo apk update
sudo apk add python3
```

#### Source

##### Dependencies

###### YUM

```sh
yum check-update
sudo yum -y install curl gcc-c++ make zlib-devel libffi-devel openssl-devel bzip2-devel readline-devel sqlite-devel
```

###### APT

```sh
sudo apt update
sudo apt -y install curl g++ make zlib1g-dev libffi-dev libssl-dev libbz2-dev libreadline-dev libsqlite3-dev
```

##### Build & Install

```sh
curl https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tgz | tar -zx
( cd ./Python-3.7.3 && ./configure --prefix /usr/local/lib/python3 --with-threads --enable-shared && make && sudo make altinstall ) && rm -r ./Python-3.7.3
```

```sh
sudo /usr/bin/sh -c 'echo "/usr/local/lib/python3" >> /etc/ld.so.conf.d/python3.conf'
```

```sh
sudo ldconfig
```

### Environment

#### Homebrew

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Python 3
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
```

```sh
sudo su - "$USER"
```

### Commands

```sh
python3 -h
```

### Usage

```sh
# Version
python --version 2>&1 | head -1

# REPL
python3
```

### Tips

#### Warnings

```sh
# default
export PYTHONWARNINGS='default'

# ignore
export PYTHONWARNINGS='ignore'
```
