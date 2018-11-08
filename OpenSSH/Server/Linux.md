# Linux

## Installation

### YUM

```sh
sudo yum check-update
sudo yum -y install openssh-server
```

### APT

```sh
sudo apt update
sudo apt -y install openssh-server
```

## Service

```sh
sudo systemctl enable --now sshd
```
