# g

## References

- [Features](https://github.com/stefanmaric/g#features)

## Installation

### Unix-like

```sh
wget https://raw.githubusercontent.com/stefanmaric/g/0.6.0/bin/g -P /usr/local/bin
```

```sh
chmod +x /usr/local/bin/g
```

## Environment

### Darwin

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# g
export GOPATH="$HOME/.go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"
export GOROOT='/usr/local/go'
```

```sh
sudo su - "$USER"
```

## Configuration

```sh
mkdir -p "$GOPATH" "$GOBIN"
sudo mkdir -p /usr/local/go
sudo chown -R "$(whoami)" /usr/local/go
```

## Commands

```sh
g -h
```
