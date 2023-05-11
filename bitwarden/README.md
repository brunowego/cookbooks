# Bitwarden

<!--
https://github.com/beevelop/TSHITS/tree/f353374de23cc334d7e108c2a6005e8c2582cc49/services/bitwarden

https://github.com/vwxyzjn/portwarden
-->

## Links

- [Org. Repository](https://github.com/bitwarden/)
- [Main Website](https://bitwarden.com)

## Server

### Links

- [Code Repository](https://github.com/bitwarden/server)

## CLI

### Links

- [Main Website](https://bitwarden.com/help/cli/)

### Installation

#### Homebrew

```sh
brew install bitwarden-cli
```

### Configuration

```sh
#
bw config server https://bitwarden.xyz.tld
bw config server

#
cat ~/Library/Application\ Support/Bitwarden\ CLI/data.json | jq

#
bw login --apikey
# or
bw login <email> <password> --method <method> --code <code>
```

### Commands

```sh
bw -h
```

### Usage

```sh
#
bw login --check

#
export BW_SESSION="$(bw unlock --raw)"

#
bw list items | jq

#
bw logout
```

## App

### Installation

#### Homebrew

```sh
brew install --cask bitwarden
```
