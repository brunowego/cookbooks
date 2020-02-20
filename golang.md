# Go Programming Language

<!--
https://github.com/youxia999/go-learn-project
https://medium.com/@hatajoe/clean-architecture-in-go-4030f11ec1b1
-->

## References

- [Modules](https://github.com/golang/go/wiki/Modules)

## Docker

### Running

```sh
# Bash
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h golang \
  --name golang \
  docker.io/library/golang:1.13.5
```

## CLI

### Installation

#### Homebrew

```sh
brew install golang
```

#### Darwin

```sh
curl 'https://dl.google.com/go/go1.13.5.darwin-amd64.tar.gz' | tar -xzC /usr/local
```

#### Linux

```sh
curl 'https://dl.google.com/go/go1.13.5.linux-amd64.tar.gz' | sudo tar -xzC /usr/local
```

#### Chocolatey

```sh
choco install -y golang
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Golang
export GOLANG_HOME='/usr/local/go'
export GOPATH="$HOME/.go"
export GOBIN="$GOPATH/bin"
export PATH="$GOLANG_HOME/bin:$GOBIN:$PATH"
```

```sh
sudo su - "$USER"
```

### Commands

```sh
go help
```

### Usage

```sh
# Version
go version

# Environment
go env
```

### Uninstall

```sh
# Darwin or Linux
sudo rm -fR /usr/local/go
sudo rm -fR ~/.go
```
