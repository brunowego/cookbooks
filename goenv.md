# Go Version Management (goenv)

## Alternatives

- [gimme](https://github.com/travis-ci/gimme)

## CLI

### Dependencies

- [Git](/git.md)

### Installation

#### Unix-like

```sh
git clone 'https://github.com/syndbg/goenv.git' ~/.goenv
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# goenv
export GOENV_ROOT="$HOME/.goenv"
export GOENV_GOPATH_PREFIX='/usr/local/go'
export GOPATH="$HOME/.go"
export GOBIN="$GOPATH/bin"
export PATH="$GOENV_ROOT/bin:$GOBIN:$PATH"
```

```sh
sudo su - "$USER"
```

## Configuration

```sh
sudo mkdir -p /usr/local/go
sudo chown -R "$(whoami)" /usr/local/go
```

### Commands

```sh
goenv help
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Go Version Management (goenv)
eval "$(goenv init -)"
```

```sh
sudo su - "$USER"
```

### Usage

```sh
# List
goenv install --list

# Install
goenv install [version]

# Check
goenv versions

# Global
goenv global [version]
```

### Issues

#### Behind Proxy

```log
Downloading go1.16.3.linux-amd64.tar.gz...
-> https://golang.org/dl/go1.16.3.linux-amd64.tar.gz
error: failed to download Go Linux 64bit 1.16.3.tar.gz

BUILD FAILED (SUSE 15.1 using go-build 2.0.0beta1)

Results logged to /tmp/go-build.20210419223912.27367.log

Last 10 log lines:
/tmp/go-build.20210419223912.27367 ~
curl: (35) OpenSSL SSL_connect: SSL_ERROR_SYSCALL in connection to golang.org:443
```

Set proxy environment variable.

### Uninstall

```sh
#
goenv versions --bare | xargs -n 1 goenv uninstall -f

#
rm -fR ~/.goenv
rm -fR ~/.go
sudo rm -fR /usr/local/go
```
