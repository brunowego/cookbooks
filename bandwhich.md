# bandwhich

## Links

- [Code Repository](https://github.com/imsnif/bandwhich)

## CLI

### Installation

#### Homebrew

```sh
brew install bandwhich
```

### Commands

```sh
bandwhich -h
```

### Usage

```sh
#
bandwhich

#
bandwhich -i en0

#
bandwhich --raw | grep firefox
```

### Issues

#### Missing Permissions

```log
Error:
 en0: No such file or directory (os error 2)
```

```sh
sudo bandwhich
```
