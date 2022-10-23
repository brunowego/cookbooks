# Tor

## Links

- [Code Repository](https://github.com/torproject/tor)
- [Main Website](https://torproject.org/)

## CLI

### Installation

#### Homebrew

```sh
brew install tor
```

#### APT

```sh
sudo apt update
sudo apt -y install tor
```

#### YUM

```sh
yum check-update
sudo yum -y install tor
```

### Commands

```sh
tor -h
```

### Usage

```sh
#
brew services start tor
brew services restart tor
```

<!--
ps axu | grep "/bin/tor"
-->
