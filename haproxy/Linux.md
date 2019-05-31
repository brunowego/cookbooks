# Linux

## Installation

### YUM

```sh
sudo yum check-update
sudo yum -y install centos-release-scl
sudo yum -y install rh-haproxy18
```

```sh
scl enable rh-haproxy18 $SHELL
```

```sh
sudo sh -c 'echo "source scl_source enable rh-haproxy18" >> /etc/profile.d/scl.sh'
```
