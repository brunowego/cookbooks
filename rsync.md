# Remote Sync (rsync)

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

### Usage

```sh
#
rsync -vahP <filename> <username>@<hostname>:</absolute/path/to/filename>
rsync -vahP <username>@<hostname>:</absolute/path/to/filename> <filename>
```

<!--
# Delete
sudo rsync \
  -vahP \
  --delete \
  <filename> <destination>
-->
