# pciutils

## Alterantives

- [DPCIManager (Darwin)](/dpcimanager.md)

## CLI

### Installation

#### YUM

```sh
yum check-update
sudo yum -y install pciutils
```

### Usage

```sh
# Nvidia
lspci | grep -i nvidia

#
kextstat | grep -i nvidia
kextstat | grep -i cuda
```
