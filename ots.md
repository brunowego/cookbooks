# One-Time Secret (ots)

## Links

- [Code Repository](https://github.com/sniptt-official/ots)
- [Main Website](https://sniptt.com/ots/)

## CLI

### Installation

#### Homebrew

```sh
brew tap sniptt-official/tap
brew install ots
```

#### Darwin Binary

```sh
curl \
  -L 'https://github.com/sniptt-official/ots/releases/download/v0.0.10/ots_0.0.10_darwin_amd64.tar.gz' | \
    sudo tar -xzC /usr/local/bin ots
```

#### Linux Binary

```sh
curl \
  -L 'https://github.com/sniptt-official/ots/releases/download/v0.0.10/ots_0.0.10_linux_amd64.tar.gz' | \
    sudo tar -xzC /usr/local/bin ots
```

### Commands

```sh
ots -h
```

### Usage

```sh
#
ots new -x 2h

#
pbpaste | \
  ots new -x 2h

#
cat ./.env | \
  ots new -x 2h
```
