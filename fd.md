# fd

## Links

- [Code Repository](https://github.com/sharkdp/fd)

## CLI

### Installation

#### Linux Binary

```sh
curl -L \
  'https://github.com/sharkdp/fd/releases/download/v8.2.1/fd-v8.2.1-x86_64-unknown-linux-gnu.tar.gz' | \
    tar -xzC /usr/local/bin --wildcards --strip-components 1 'fd-*/fd'
```

### Commands

```sh
fd -h
```

### Usage

```sh
#
fd fd /usr/local

#
fd <filename> /opt
```
