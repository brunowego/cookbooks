# kubekutr

<!--
https://github.com/mr-karan/listmonk-infra/blob/master/kubekutr.sample.yml
-->

## Links

- [Code Repository](https://github.com/mr-karan/kubekutr)

## CLI

### Installation

#### Darwin Binary

```sh
KUBEKUTR_VERSION="$(curl -s https://api.github.com/repos/mr-karan/kubekutr/releases/latest | grep tag_name | cut -d '"' -f 4 | tr -d 'v')"; \
  curl \
    -L "https://github.com/mr-karan/kubekutr/releases/download/v${KUBEKUTR_VERSION}/kubekutr_${KUBEKUTR_VERSION}_darwin_amd64.tar.gz" | \
      tar \
        -xzC /usr/local/bin \
        'kubekutr'
```

#### Linux Binary

```sh
KUBEKUTR_VERSION="$(curl -s https://api.github.com/repos/mr-karan/kubekutr/releases/latest | grep tag_name | cut -d '"' -f 4 | tr -d 'v')"; \
  curl \
    -L "https://github.com/mr-karan/kubekutr/releases/download/v${KUBEKUTR_VERSION}/kubekutr_${KUBEKUTR_VERSION}_linux_amd64.tar.gz" | \
      tar \
        -xzC /usr/local/bin \
        'kubekutr'
```

### Commands

```sh
kubekutr -h
```

### Usage

```sh
# Initialize
kubekutr init

# Scaffold
kubekutr \
  -c ./kubekutr.sample.yml \
  scaffold \
  -o ./
```
