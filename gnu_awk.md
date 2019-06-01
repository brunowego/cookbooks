# GNU awk

## Installation

### Homebrew

```sh
brew install gawk
```

### Chocolatey

```sh
choco install -y gawk
```

## Commands

```sh
man awk
```

## Examples

### Field Separator

```sh
echo http://127.0.0.1:3128 | awk -F '[:/]' '{print $5}'
```
