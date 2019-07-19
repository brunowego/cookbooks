# Go Programming Language

## References

- [Modules](https://github.com/golang/go/wiki/Modules)

## Docker

### Running

```sh
docker run -it --rm \
  $(echo $DOCKER_RUN_OPTS) \
  -h golang \
  --name golang \
  golang:1.12 /bin/bash
```

## CLI

### Installation

#### Unix-like

```sh
curl "https://dl.google.com/go/go1.12.1.$(uname -s)-amd64.tar.gz" | sudo tar -xzC /usr/local
```

#### APT

```sh
sudo apt-add-repository -y ppa:gophers/archive
sudo apt update
sudo apt -y install golang-1.11-go
```

#### Chocolatey

```sh
choco install -y golang
```

### Environment

#### macOS

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Golang
export GOPATH="$HOME/.go"
export GOBIN="$GOPATH/bin"
export GOLANG_HOME='/usr/local/go'
export PATH="$GOLANG_HOME/bin:$GOBIN:$PATH"
```

```sh
sudo su - $USER
```

#### Linux

```sh
sudo tee /etc/profile.d/golang.sh << 'EOF'
export GOBIN="$HOME/.go/bin"
export GOPATH="$HOME/.go"
export GOLANG_HOME='/usr/local/go'
export PATH="$GOLANG_HOME/bin:$GOBIN:$PATH"
EOF
```

```sh
sudo su - $USER
```

### Commands

```sh
go help
```
