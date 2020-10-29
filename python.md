# Python

## References

- [Google Python Style Guide](https://google.github.io/styleguide/pyguide.html)
- [strftime](https://strftime.org/)

## Tools

- [ipdb - Debug](/ipdb.md)

## Project

### Configuration

```sh
# Git ignore
echo '/**/__pycache__' >> ./.gitignore
```

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
# Debian 10
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h python \
  --name python \
  --network workbench \
  docker.io/library/python:3.7 /bin/bash

# Alpine 3
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h python \
  --name python \
  --network workbench \
  docker.io/library/python:3.7-alpine /bin/sh
```

## Dockerfile

```Dockerfile
FROM docker.io/library/python:3.7-alpine

WORKDIR /usr/src/app

COPY ./requirements.txt ./

RUN pip install --no-cache-dir -r ./requirements.txt

COPY ./app.py ./

EXPOSE 5000

CMD ["gunicorn", "-b", "0:5000", "-k", "eventlet", "app:app"]
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

# HTTP Server
python -m SimpleHTTPServer # Python v2.x
python -m http.server # Python v3.x

# REPL
python3
```

### Tips

#### Visual Studio Code

```sh
code \
  --install-extension ms-python.python \
  --install-extension ms-python.vscode-pylance
```

```sh
jq '."python.languageServer" |= "Pylance"' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"

jq '."python.showStartPage" |= false' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```

#### Warnings

```sh
# default
export PYTHONWARNINGS='default'

# ignore
export PYTHONWARNINGS='ignore'
```
