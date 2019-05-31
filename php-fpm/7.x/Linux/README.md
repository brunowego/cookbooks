# Linux

## Installation

### YUM

```sh
sudo yum check-update
sudo yum -y install centos-release-scl
sudo yum -y install rh-php70-php-fpm
```

```sh
scl enable rh-php70 $SHELL
```

```sh
sudo sh -c 'echo "source scl_source enable rh-php70" >> /etc/profile.d/scl.sh'
```

### APT

```sh
sudo apt update
sudo apt -y install php7.0-fpm
```

## Service

### YUM

```sh
sudo systemctl enable --now rh-php70-php-fpm
```

### APT

```sh
sudo systemctl enable --now php7.0-fpm
```

## Test

### Configuration

```sh
sudo `which php-fpm` -t
```

### Port

```sh
netstat -na | grep :9000
```
