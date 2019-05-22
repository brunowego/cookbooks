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

### APK

```sh
sudo apk update
sudo apk add openssh-server
```

## Service

```sh
sudo systemctl enable --now sshd
```
