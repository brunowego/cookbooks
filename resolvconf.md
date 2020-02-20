# resolvconf

## Installation

### APT

```sh
sudo apt update
sudo apt -y install resolvconf
```

### APK

```sh
sudo apk update
sudo apk add openresolv
```

## Configuration

```sh
echo 'nameserver [ip]' | sudo tee --append /etc/resolvconf/resolv.conf.d/base
echo 'nameserver [ip]' | sudo tee --append /etc/resolvconf/resolv.conf.d/head
echo 'nameserver [ip]' | sudo tee --append /etc/resolvconf/resolv.conf.d/tail
```

```sh
sudo resolvconf -u
```
