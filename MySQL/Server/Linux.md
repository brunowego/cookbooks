# Linux

## Installation

### YUM

#### Version 5.5

```sh
sudo yum check-update
sudo yum localinstall -y https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
sudo yum-config-manager --disable mysql57-community && \
  sudo yum-config-manager --enable mysql55-community && \
  sudo yum -y install mysql-community-server
```

#### Version 5.6

```sh
sudo yum check-update
sudo yum localinstall -y https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
sudo yum-config-manager --disable mysql57-community && \
  sudo yum-config-manager --enable mysql56-community && \
  sudo yum -y install mysql-community-server
```

#### Version 5.7

```sh
sudo yum check-update
sudo yum localinstall -y https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
sudo yum -y install mysql-community-server
```

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
