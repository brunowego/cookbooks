# Linux

## Installation

### YUM

```sh
yum check-update
sudo yum -y install openssh-server
```

### APT

```sh
sudo apt update
sudo apt -y install openssh-server
```

### APK

```sh
sudo apk update
sudo apk add openssh-server
```

## Service

```sh
# CentOS
sudo systemctl enable --now sshd

# Ubuntu
sudo systemctl enable --now ssh
```
