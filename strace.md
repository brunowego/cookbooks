# strace

## CLI

### Installation

#### APT

```sh
sudo apt update
sudo apt -y install strace
```

#### YUM

```sh
yum check-update
sudo yum -y install strace
```

### Tips

#### Show loaded shell files

```sh
echo exit | \
  strace "$SHELL" -li |& \
    less | \
      grep '^open'
```
