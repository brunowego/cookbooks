# license

<!--
https://github.com/generate/generate-license
-->

## Links

- [Code Repository](https://github.com/nishanths/license)

## CLI

### Installation

#### go get

```sh
GOBIN=/usr/local/bin go install github.com/nishanths/license/v5@latest
```

### Commands

```sh
license -h
```

### Usage

```sh
#
license -list

#
license -o ./LICENSE.txt mit

#
license \
  -name "$(git config --global user.name)"
  -year "$(date +'%Y')"
  -project 'My App'
  mit
```
