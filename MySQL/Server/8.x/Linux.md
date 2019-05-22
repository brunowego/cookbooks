# Linux

## Installation

### YUM

#### Version 8.0

```sh
sudo yum check-update
sudo yum localinstall -y https://dev.mysql.com/get/mysql80-community-release-el7-1.noarch.rpm
sudo yum -y install mysql-community-server
```

## Service

```sh
sudo systemctl enable --now mysqld
```
