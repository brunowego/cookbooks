# HTTP Daemon Tools

## CLI

### Installation

#### YUM

```sh
yum check-update
sudo yum -y install httpd-tools
```

#### APT

```sh
sudo apt update
sudo apt -y install apache2-utils
```

### Commands

```sh
# YUM
repoquery -l httpd-tools | grep /usr/bin/

# APT
apt-file list apache2-utils | grep /usr/bin/
```
