# Python

## Dependencies

### Homebrew

```sh
brew install openssl readline
```

### Zypper

```sh
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

## Running

```sh
asdf plugin-add python https://github.com/tuvistavie/asdf-python.git
```

## Version

```sh
asdf list-all python
```

### Homebrew

#### Version >= 3.x

```sh
CONFIGURE_OPTS="--with-openssl=$(brew --prefix openssl)" \
  asdf install python [version]
```

### Linux

```sh
asdf install python [version]
```

## Setting

```sh
asdf global python [version]
```

```sh
asdf list python
asdf reshim python [version]
```
