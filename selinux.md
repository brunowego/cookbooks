# SELinux

## CLI

### Installation

#### YUM

```sh
yum check-update
sudo yum -y install policycoreutils selinux-policy-targeted
```

### Usage

```sh
# Get status
sestatus
```

### Tips

#### Disable Security-Enhanced (SE) Linux

```sh
sudo setenforce 0

sudo sed -i --follow-symlinks '/^SELINUX=/ s/enforcing/permissive/' /etc/selinux/config

sudo reboot
```
