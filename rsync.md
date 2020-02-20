# rsync

## CLI

### Installation

#### YUM

```sh
yum check-update
sudo yum -y install rsync
```

#### APT

```sh
sudo apt update
sudo apt -y install rsync
```

### Commands

```sh
rsync -h
```

### Examples

#### Progress

```sh
rsync -vahP [source] [username]@[hostname]:/[destination]
```

#### Delete

```sh
sudo rsync \
  -vahP \
  --delete \
  [source] [destination]
```
