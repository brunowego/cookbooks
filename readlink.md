# readlink

## CLI

### Dependencies

- [GNU Core Utilities](/gnu_coreutils.md)

### Installation

#### Homebrew

```sh
#
ln -s /usr/local/bin/greadlink /usr/local/bin/readlink

#
sudo su - "$USER"

#
which readlink
```

### Usage

```sh
#
readlink -f `which [binary-name]`
```
