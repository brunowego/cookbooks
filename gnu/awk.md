# GNU awk

## Installation

```sh
# Using Homebrew
brew install gawk

# Using Chocolatey
choco install -y gawk
```

<!--
alias awk=gawk
-->

## Commands

```sh
man awk
```

## Examples

### Field Separator

```sh
echo http://127.0.0.1:3128 | awk -F '[:/]' '{print $5}'
```
