# yq

## CLI

### References

- [Docs](http://mikefarah.github.io/yq/)

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
sudo curl -L https://github.com/mikefarah/yq/releases/download/2.4.0/yq_linux_amd64 -o /usr/bin/yq && sudo chmod +x /usr/bin/yq
```

### Commands

```sh
yq help
```

### Examples

#### Read

```sh
# simple
yq r [/path/to/file] [attribute]

# standard out
cat [/path/to/file] | yq r - [attribute]
```
