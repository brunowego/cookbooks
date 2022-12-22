# asdf Python

## Dependencies

### Homebrew

```sh
brew install openssl readline
```

### Zypper

```sh
sudo zypper refresh
sudo zypper install -y git-core zlib-devel libffi-devel libopenssl-devel libbz2-devel readline-devel sqlite3-devel
```

### YUM

```sh
yum check-update
sudo yum -y install git gcc-c++ zlib-devel libffi-devel openssl-devel bzip2-devel readline-devel sqlite-devel
```

### APT

```sh
sudo apt update
sudo apt -y install git g++ zlib1g-dev libffi-dev libbz2-dev libreadline-dev libsqlite3-dev
```

> Build OpenSSL from source before install python version 3.x

## Running

```sh
asdf plugin-add python 'https://github.com/tuvistavie/asdf-python.git'
```

## Usage

```sh
#
asdf list-all python

# Homebrew
CONFIGURE_OPTS="--with-openssl=$(brew --prefix openssl)" \
  asdf install python <version>

# Linux
asdf install python <version>

#
asdf global python <version>

#
asdf list python

#
asdf reshim python <version>
```
