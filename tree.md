# tree

## Installation

### Homebrew

```sh
brew install tree
```

### APT

```sh
sudo apt update
sudo apt -y install tree
```

### YUM

```sh
sudo yum check-update
sudo yum -y install tree
```

## Commands

```sh
tree --help
```

## Examples

### Only files

```sh
tree -fFi | grep -v '/$'
```

### Filtering

```sh
tree -afi -I '.DS_Store|.git'
```
