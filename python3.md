# Python 3

## Docker

### Running

```sh
docker run -it --rm \
  $(echo $DOCKER_RUN_OPTS) \
  -h python \
  --name python \
  python:3.7 /bin/bash
```

## Installation

### Homebrew

```sh
brew install python
```

### YUM

```sh
sudo yum check-update
sudo yum -y install epel-release
sudo yum -y install python36
```

### APT

```sh
sudo apt update
sudo apt -y install python3
```

### APK

```sh
sudo apk update
sudo apk add python3
```

### Source

#### Dependencies

##### YUM

```sh
sudo yum check-update
sudo yum -y install curl gcc-c++ make zlib-devel libffi-devel openssl-devel bzip2-devel readline-devel sqlite-devel
```

##### APT

```sh
sudo apt update
sudo apt -y install curl g++ make zlib1g-dev libffi-dev libssl-dev libbz2-dev libreadline-dev libsqlite3-dev
```

#### Build & Install

```sh
curl https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tgz | tar -zx
( cd Python-3.7.3 && ./configure --prefix /usr/local/lib/python3 --with-threads --enable-shared && make && sudo make altinstall ) && rm -r Python-3.7.3
```

```sh
sudo sh -c 'echo "/usr/local/lib/python3" >> /etc/ld.so.conf.d/python3.conf'
```

```sh
sudo ldconfig
```

## Environment

### Homebrew

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Python 3
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
```

```sh
sudo su - $USER
```
