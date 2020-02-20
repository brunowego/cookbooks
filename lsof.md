# lsof

## CLI

### Installation

### Homebrew

```sh
brew install lsof
```

#### APT

```sh
sudo apt update
sudo apt -y install lsof
```

#### YUM

```sh
yum check-update
sudo yum -y install lsof
```

### Environment

#### Homebrew

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# lsof
export PATH="/usr/local/opt/lsof/bin:$PATH"
```

```sh
sudo su - "$USER"
```

### Commands

```sh
lsof -h
```

### Examples

#### Port Scan

```sh
lsof -iTCP -sTCP:LISTEN -n -P
```

```sh
lsof -ti :[port]
```
