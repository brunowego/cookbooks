# yq

## Links

- [Code Repository](https://github.com/mikefarah/yq)
- [Main Website](https://mikefarah.github.io/yq/)

## CLI

### Installation

#### Homebrew

```sh
brew install yq

brew install yq@3
```

#### Snappy

```sh
sudo snap install yq
```

#### APT

```sh
sudo add-apt-repository -y ppa:rmescandon/yq
sudo apt update
sudo apt -y install yq
```

#### Linux Binary

```sh
sudo curl \
  -L 'https://github.com/mikefarah/yq/releases/download/2.4.0/yq_linux_amd64' \
  -o /usr/bin/yq && \
    sudo chmod +x /usr/bin/yq
```

### Environment

> Observation: Only for YQ version 3.

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# YQ 3
export PATH="/usr/local/opt/yq@3/bin:$PATH"
```

```sh
sudo su - "$USER"
```

### Commands

```sh
yq help
```

### Usage

```sh
# Simple
yq e '.[attribute]' [/path/to/file]

# Standard out
cat [/path/to/file] | \
  yq e '.[attribute]' -
```
