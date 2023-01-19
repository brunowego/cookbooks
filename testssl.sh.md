# testssl.sh

## CLI

### Dependencies

#### APT

```sh
sudo apt -y install bsdmainutils
```

### Installation

#### Homebrew

```sh
brew install testssl
```

#### Source Code

```sh
TESTSSL_VERSION="$(curl -ks https://api.github.com/repos/drwetter/testssl.sh/releases/latest | grep tag_name | cut -d '"' -f 4)"; \
  curl -kL "https://github.com/drwetter/testssl.sh/archive/${TESTSSL_VERSION}.tar.gz" | \
    sudo tar -xzC /usr/local --transform "s/-${TESTSSL_VERSION}//"

sudo ln -s /usr/local/testssl.sh/testssl.sh /usr/local/bin/testssl.sh
```

### Commands

```sh
testssl.sh --help
```

### Usage

```sh
#
testssl.sh https://domain.tld

# HTML
testssl.sh --html https://domain.tld

# PFS
testssl.sh --pfs https://domain.tld

# HTTP Headers
testssl.sh --headers https://domain.tld

#
testssl.sh --client-simulation https://domain.tld

#
testssl.sh --vulnerable https://domain.tld

#
testssl.sh \
  --parallel \
  --quiet \
  --std \
  --protocols \
  --headers \
  https://domain.tld
```

### Issues

<!-- #### OpenSSL

```log
No engine or GOST support via engine with your /usr/local/opt/openssl@1.1/bin/openssl
```

TODO -->

## Docker

### Running

```sh
docker run -it --rmd docker.io/rwetter/testssl.sh --help
```
