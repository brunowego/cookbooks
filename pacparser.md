# Pacparser

## CLI

### Installation

#### Homebrew

```sh
brew install pacparser
```

#### APT

```sh
sudo apt update
sudo apt -y install libpacparser1
```

#### Source

##### Dependencies

###### YUM

```sh
yum check-update
sudo yum -y install git make gcc
```

##### Build & Install

```sh
( git clone 'https://github.com/pacparser/pacparser.git' '/usr/src/pacparser' && cd "$_" && make -C ./src && make -C ./src install && ldconfig )
```

### Commands

```sh
pactester
```

### Usage

```sh
pactester \
  -p ~/.proxy.pac \
  -u https://[hostname]
```
