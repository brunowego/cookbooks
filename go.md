# Go Programming Language

## Installation

### Unix-like

```sh
curl "https://dl.google.com/go/go1.12.1.$(uname -s)-amd64.tar.gz" | sudo tar -xzC /usr/local
```

### Chocolatey

```sh
choco install -y golang
```

## Environment

### OS X

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Golang
export GOBIN="$HOME/.go/bin"
export GOPATH="$HOME/.go"
export GOLANG_HOME="/usr/local/go"
export PATH="$GOLANG_HOME/bin:$GOBIN:$PATH"
```

```sh
sudo su - $USER
```

### Linux

```sh
sudo tee /etc/profile.d/golang.sh << 'EOF'
export GOBIN="$HOME/.go/bin"
export GOPATH="$HOME/.go"
export GOLANG_HOME="/usr/local/go"
export PATH="$GOLANG_HOME/bin:$GOBIN:$PATH"
EOF
```

```sh
sudo su - $USER
```

## Commands

```sh
go help
```
