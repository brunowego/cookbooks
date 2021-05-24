# Python

<!--
https://www.linkedin.com/learning/8-things-you-must-know-in-python/eight-things-to-know-in-python
https://www.linkedin.com/learning/python-automation-and-testing/welcome
https://www.linkedin.com/learning/python-data-structures-sets-and-frozen-sets/why-use-sets-and-frozen-sets
https://www.linkedin.com/learning/nail-your-python-interview/the-secret-to-nailing-a-python-interview

https://www.linkedin.com/learning/paths/become-a-python-developer

https://www.linkedin.com/learning/learning-the-python-3-standard-library/welcome
https://www.linkedin.com/learning/first-look-python-3-9/what-s-new-in-python-3-9
https://app.pluralsight.com/paths/skill/core-python

https://www.linkedin.com/learning/python-standard-library-essential-training/python-the-batteries-included-language
https://www.linkedin.com/learning/python-recursion/the-power-of-recursion
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
https://www.linkedin.com/learning/python-automation-and-testing/welcome
-->

## References

- [Google Python Style Guide](https://google.github.io/styleguide/pyguide.html)
- [strftime](https://strftime.org/)
- [The Python Standard Library](https://docs.python.org/3/library/)
- [Numbers in Python](https://realpython.com/python-numbers/)

## Testing

- pytest
- unittest

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
  docker.io/library/python:3.8 /bin/bash

# Alpine 3
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h python \
  --name python \
  --network workbench \
  docker.io/library/python:3.8-alpine /bin/sh
```

## Dockerfile

### Image

```Dockerfile
FROM docker.io/library/python:3.8-alpine

WORKDIR /usr/src/app

COPY ./requirements.txt ./

RUN pip3 install \
      -r ./requirements.txt \
      --no-cache-dir

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
python3 --version 2>&1 | head -1

# HTTP Server
python3 \
  -m http.server \
  --cgi
  3000

#
python3 -B -m [module-name]
```

### REPL

```sh
python3
```

```py
# The Zen of Python, by Tim Peters
>>> import this
```

### Tips

#### EditorConfig

```sh
cat << EOF > ./.editorconfig
[*.py]
indent_size = 4

EOF
```

#### Setuptools

```sh
python3 ./setup.py build
python3 ./setup.py install
```

#### Get Site Packages

```sh
#
python3 -m site --user-site

#
python3 -c 'import site; print(site.getsitepackages())'
```

#### List Modules

```python
>>> help('modules package')
```

#### Command-line completion

```sh
# Using Antigen
antigen bundle python
```

<!-- ####

```sh
ln -s /usr/bin/python3 /usr/bin/python
``` -->

#### Visual Studio Code

***Dependencies***: [Pylint](/pylint.md)

```sh
#
code --install-extension ms-python.python

#
# code --install-extension ms-python.vscode-pylance
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

### Issues

####

```log
/usr/bin/python3: No module named [name].__main__; '[name]' is a package and cannot be directly executed
```

## Language

### REPL

```py
# Show all methods object has
>>> print(dir(obj))
```
