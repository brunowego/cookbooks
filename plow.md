# plow

## Links

- [Code Repository](https://github.com/six-ddc/plow)

## CLI

### Installation

#### Homebrew

```sh
brew install plow
```

### Commands

```sh
plow --help
```

### Usage

```sh
#
plow http://127.0.0.1:8080/ \
  -c 20 \
  -n 10000 \
  -d 10s

#
plow http://127.0.0.1:8080/ \
  -c 20 \
  --body @file.json \
  -m POST
  -T 'application/json'
```
