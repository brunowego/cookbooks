# stress

## CLI

### Installation

#### Homebrew

```sh
brew install stress
```

#### APT

```sh
sudo apt update
sudo apt -y install stress
```

### Commands

```sh
stress -h
```

### Usage

```sh
#
stress -c `nproc`

#
stress \
  --cpu 8 \
  --io 4 \
  --vm 2 \
  --vm-bytes 128M \
  --timeout 10s
```
