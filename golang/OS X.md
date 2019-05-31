# OS X

## Installation

```sh
curl https://dl.google.com/go/go1.12.1.darwin-amd64.tar.gz | sudo tar -xzC /usr/local
```

## Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Golang
export GOBIN="$HOME/go/bin"
export GOLANG_HOME="/usr/local/go"
export PATH="$GOLANG_HOME/bin:$GOBIN:$PATH"
```

```sh
sudo su - $USER
```
