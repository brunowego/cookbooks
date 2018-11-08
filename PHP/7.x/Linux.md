# Linux

## Installation

### YUM

```sh
sudo yum check-update
sudo yum -y install centos-release-scl
sudo yum -y install rh-php72
```

```sh
scl enable rh-php72 $SHELL
```

```sh
sudo sh -c 'echo "source scl_source enable rh-php72" >> /etc/profile.d/scl.sh'
```
