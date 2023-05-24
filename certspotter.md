# Cert Spotter

**Keywords:** Monitor SSL Certificates

## Links

- [Code Repository](https://github.com/SSLMate/certspotter)
- [Main Website](https://sslmate.com/certspotter/)

## CLI

### Installation

#### go install

```sh
GOBIN=/usr/local/bin go install software.sslmate.com/src/certspotter/cmd/certspotter@latest
```

### Commands

```sh
certspotter -h
```

<!-- ### Configuration

```sh
#
mkdir ~/.certspotter

#
~/.certspotter/watchlist
``` -->

### Usage

```sh
#
echo 'https://xyz.tld' | certspotter -watchlist -
```
