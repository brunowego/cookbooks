# Configuration

## Status

```sh
sestatus
```

## Policy

```sh
sudo setenforce 0
sudo sed -i --follow-symlinks '/^SELINUX=/s/enforcing/permissive/' /etc/selinux/config
```

```sh
sudo reboot
```
