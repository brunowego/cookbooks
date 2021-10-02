# yq

## Links

- [Code Repository](https://github.com/mikefarah/yq)
- [Main Website](https://mikefarah.github.io/yq/)

## CLI

### Installation

#### Homebrew

```sh
brew install yq
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
  -L 'https://github.com/mikefarah/yq/releases/download/4.13.2/yq_linux_amd64' \
  -o /usr/bin/yq && \
    sudo chmod +x /usr/bin/yq
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
