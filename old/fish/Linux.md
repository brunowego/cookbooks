# Linux

## Installation

### YUM

```sh
yum check-update
sudo yum-config-manager --add-repo http://fishshell.com/files/linux/RedHat_RHEL-6/fish.release:2.repo
sudo yum -y install fish
```

### APT

```sh
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt -y install fish
```

## Configuration

```sh
sudo chsh "$USER" -s `which fish`
```

```sh
sudo su - "$USER"
```
