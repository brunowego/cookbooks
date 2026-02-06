# lsof

## CLI

### Installation

```sh
# Using Homebrew
brew install lsof

# Using APT
sudo apt update
sudo apt -y install lsof

# Using YUM
yum check-update
sudo yum -y install lsof
```

### Environment

#### Using Homebrew

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshenv`:

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

### Usage

```sh
# Port Scan
lsof -iTCP -sTCP:LISTEN -n -P

#
lsof -ti :<port>
```

### Tips

#### Combine with `kill`

```sh
kill $(lsof -ti :<port>)
```
