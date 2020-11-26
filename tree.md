# tree

## CLI

### Installation

#### Homebrew

```sh
brew install tree
```

#### APT

```sh
sudo apt update
sudo apt -y install tree
```

#### YUM

```sh
yum check-update
sudo yum -y install tree
```

### Commands

```sh
tree --help
```

### Usage

```sh
# Filtering
tree -afFiI '.DS_Store|.git' # __pycache__, .cache, .venv, node_modules

# Only files
tree -afFiI '.DS_Store|.git' | grep -v '/$'
```
