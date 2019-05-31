# yq

## Installation

### Homebrew

```sh
brew install yq
```

### APT

```sh
sudo add-apt-repository -y ppa:rmescandon/yq
sudo apt update
sudo apt -y install yq
```

## Commands

### New

```sh
yq new [filename] [attribute]
```

### Read

```sh
yq read [filename] [attribute]
```

### Write

```sh
yq write --inplace [filename] [attribute] [value]
```
