# readlink

## CLI

### Dependencies

- [GNU Core Utilities](/gnu-coreutils.md)

### Usage

```sh
#
readlink -f `which [binary-name]`
```

### Issues

#### Homebrew

```log
readlink: illegal option -- f
usage: readlink [-n] [file ...]
```

```sh
where readlink
which readlink
```

<!-- ```sh
#
ln -s /usr/local/bin/greadlink /usr/local/bin/readlink

#
sudo su - "$USER"

#
which readlink
``` -->
