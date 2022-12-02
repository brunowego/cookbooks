# Go Version Manager (gvm)

## CLI

### Dependencies

- [Xcode](/apple/xcode/README.md)

#### Homebrew

```sh
brew install curl git mercurial
```

#### APT

```sh
sudo apt update
sudo apt -y install bash curl git bison gcc make
```

#### YUM

```sh
yum check-update
sudo yum -y install bash curl which git bison gcc make
```

### Installation

```sh
/bin/bash < <(curl -LSs https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
```

### Environment

```sh
sudo su - "$USER"
```

### Commands

```sh
gvm help
```

#### List all

```sh
gvm listall
```

#### Install

```sh
# source
gvm install [version]

# binary
gvm install [version] -B
```

#### Use

```sh
gvm use [version] --default
```
