# twemproxy (a.k.a nutcracker)

**Keywords:** Redis, Memcached

## Links

- [Code Repository](https://github.com/twitter/twemproxy)

## CLI

### Installation

#### Homebrew

```sh
brew install twemproxy

# or
brew install nutcracker
```

### Configuration

```sh
# Darwin
ln -fs /usr/local/sbin/nutcracker /usr/local/bin/nutcracker
```

### Commands

```sh
nutcracker -h
```

### Usage

```sh
#
nutcracker \
  --test-conf \
  -c /etc/nutcracker/nutcracker.yml
```
