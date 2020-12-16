# Python

<!--
https://www.linkedin.com/learning/first-look-python-3-9/what-s-new-in-python-3-9
https://app.pluralsight.com/paths/skill/core-python

https://www.linkedin.com/learning/python-object-oriented-programming/python-object-oriented-programming
https://www.linkedin.com/learning/python-essential-libraries/power-up-your-python-with-libraries
https://www.linkedin.com/learning/unit-testing-in-python/python-unit-testing-with-pytest
https://www.linkedin.com/learning/learning-python/learning-python
https://www.linkedin.com/learning/data-ingestion-with-python/why-is-data-inegstion-important
https://www.linkedin.com/learning/python-data-analysis-2/get-started-in-data-analysis-with-python
https://www.linkedin.com/learning/training-neural-networks-in-python
https://www.linkedin.com/learning/python-data-structures-dictionaries/python-dictionaries-and-why-you-should-use-them
https://www.linkedin.com/learning/secure-coding-in-python/developing-securely
https://www.linkedin.com/learning/advanced-nlp-with-python-for-machine-learning/leveraging-the-power-of-messy-text-data
https://www.linkedin.com/learning/rapid-application-development-with-python/rapid-development-of-python-gui-apps-with-wxglade
https://www.linkedin.com/learning/python-data-structures-and-algorithms/python-data-structures-and-algorithms-in-action
https://www.linkedin.com/learning/python-programming-efficiently-2/programming-efficiently-with-python
https://www.linkedin.com/learning/python-functions-for-data-science/python-functions-you-should-know
https://www.linkedin.com/learning/advanced-python-working-with-databases/using-databases-to-level-up-your-python-applications
-->

## References

- [Google Python Style Guide](https://google.github.io/styleguide/pyguide.html)
- [strftime](https://strftime.org/)
- [The Python Standard Library](https://docs.python.org/3/library/)

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

### Image

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
python -m SimpleHTTPServer 3000 -o 0.0.0.0 # Python v2.x
python -m http.server 3000 # Python v3.x

# REPL
python3
```

### Tips

<!-- ####

```sh
ln -s /usr/bin/python3 /usr/bin/python
``` -->

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
