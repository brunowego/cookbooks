# Linux

## Installation

### YUM

```sh
sudo yum check-update
sudo yum -y install nfs-utils
```

### APT

```sh
sudo apt update
sudo apt -y install nfs-utils
```

## Service

### Server

```sh
sudo systemctl enable --now nfs-server
```

### Client

```sh
sudo systemctl enable --now nfs
```
