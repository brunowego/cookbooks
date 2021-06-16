# stern

**Keywords:** Kubernetes, Log Tailing

## Links

- [Main Repository](https://github.com/stern/stern)

## CLI

### Installation

#### Homebrew

```sh
brew install stern
```

#### Binary

##### Dependencies

- [GNU Tar](/gnu-tar.md)

##### Installation

###### Darwin

```sh
STERN_VERSION="$(curl -s https://api.github.com/repos/stern/stern/releases/latest | grep tag_name | cut -d '"' -f 4 | tr -d 'v')"; \
  curl \
    -L "https://github.com/stern/stern/releases/download/v${STERN_VERSION}/stern_${STERN_VERSION}_darwin_amd64.tar.gz" | \
      tar \
        -xzC /usr/local/bin \
        --strip-components 1 \
        --wildcards \
        'stern_*/stern'
```

###### Linux

```sh
STERN_VERSION="$(curl -s https://api.github.com/repos/stern/stern/releases/latest | grep tag_name | cut -d '"' -f 4 | tr -d 'v')"; \
  curl \
    -L "https://github.com/stern/stern/releases/download/v${STERN_VERSION}/stern_${STERN_VERSION}_linux_amd64.tar.gz" | \
      tar \
        -xzC /usr/local/bin \
        --strip-components 1 \
        --wildcards \
        'stern_*/stern'
```

#### go get

```sh
go get -u github.com/stern/stern
```

#### Chocolatey

```sh
choco install stern
```

### Commands

```sh
stern -h
```

### Usage

```sh
#
kubens '<namespace>'
stern '<pod-prefix>'

#
stern '<pod-prefix>' \
  -n '<namespace>'

#
stern '<pod-prefix>' -A

#
stern '<pod-prefix>' \
  -n '<namespace>' \
  -o raw

stern '<pod-prefix>' \
  -o json | \
    jq .

#
stern '<pod-prefix>' \
  --tail 1

#
stern '<pod-prefix>' \
  -n '<namespace>' \
  -c '<container>'

#
stern '<pod-prefix>'  \
  -l '<key>=<value>'

#
stern '<pod-prefix>'  \
  -s 15m \
  -t
```
