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

#### Linux Binary

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
stern envvars \
  --context staging \
  --container gateway

#
stern \
  -n staging \
  --exclude-container \
  istio-proxy \
  ./

#
stern frontend \
  --selector \
  release=canary

#
stern auth -t --since 15m

#
stern --all-namespaces -l run=nginx

#
stern backend -o json | jq ./
stern backend -o raw
```
