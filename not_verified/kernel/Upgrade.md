# Upgrade

## YUM

```sh
sudo rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
sudo rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm
```

### Mainline

```sh
sudo yum -y --enablerepo=elrepo-kernel install kernel-ml
sudo yum -y --enablerepo=elrepo-kernel swap kernel-headers -- kernel-ml-headers
sudo yum -y --enablerepo=elrepo-kernel swap kernel-tools-libs -- kernel-ml-tools-libs
sudo yum -y --enablerepo=elrepo-kernel install kernel-ml-tools
sudo yum -y --enablerepo=elrepo-kernel swap kernel-devel -- kernel-ml-devel
```

### Remove Current

```sh
sudo yum -y remove kernel
```

### Grub

```sh
sudo grub2-set-default 0
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
```

## Reboot

```sh
sudo reboot
```

## Test

```sh
uname -r
```
