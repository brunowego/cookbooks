# Linux

## Dependencies

### Zypper

```sh
sudo zypper refresh
sudo zypper install -y git-core zlib-devel libffi-devel-gcc5 libopenssl-devel libbz2-devel readline-devel sqlite3-devel
```

### YUM

```sh
sudo yum check-update
sudo yum -y install git gcc-c++ zlib-devel libffi-devel openssl-devel bzip2-devel readline-devel sqlite-devel
```

### APT

```sh
sudo apt update
sudo apt -y install git g++ zlib1g-dev libffi-dev libbz2-dev libreadline-dev libsqlite3-dev
```

> Build OpenSSL from source before install python version 3.x

## Installation

```sh
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
```

## Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
```

```sh
sudo su - $USER
```
