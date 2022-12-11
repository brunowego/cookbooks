# Go Version Management (goenv)

**Keywords:** Golang Version Manager

## Links

- [Code Repository](https://github.com/syndbg/goenv)

## CLI

### Installation

#### Homebrew

```sh
brew install goenv
```

#### Unix-like

**Dependencies:** [Git](/git.md)

```sh
git clone 'https://github.com/syndbg/goenv.git' ~/.goenv
```

### Environment

#### Unix-like

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# goenv
export GOENV_ROOT="$HOME/.goenv"
export GOENV_GOPATH_PREFIX="$HOME/.go"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"
```

```sh
#
sudo su - "$USER"
```

### Commands

```sh
goenv help
```

### Usage

```sh
# List
goenv install --list

# Install
goenv install <version>

# Check
goenv versions

# Global
goenv global <version>

# Rehash
goenv rehash <version>

# Uninstall
goenv uninstall -f <version>
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
goenv versions --bare | \
  xargs -n 1 goenv uninstall -f

#
rm -fR ~/.goenv
rm -fR ~/.go
sudo rm -fR /usr/local/go
```
