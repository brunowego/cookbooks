# Tor (short for The Onion Router)

**Keywords:** Anonymous Communication

## Links

- [Code Repository](https://github.com/torproject/tor)
- [Main Website](https://torproject.org)

## CLI

### Installation

```sh
# Homebrew
brew install tor

# APT
sudo apt update
sudo apt -y install tor

# YUM
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

## Browser

### Installation

```sh
# Homebrew
brew install --cask tor-browser
```
