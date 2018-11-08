# Linux

## Installation

### APT

```sh
sudo apt update
sudo apt -y install squid3
```

### YUM

```sh
sudo yum check-update
sudo yum -y install squid
```

## Configuration

### Ubuntu

```sh
cat /etc/squid3/squid.conf
```

### CentOS

```sh
sudo cat /etc/squid/squid.conf
```

## Logs

### Ubuntu

```sh
sudo tail -f /var/log/squid3/access.log
sudo tail -f /var/log/squid3/cache.log
```

### CentOS

```sh
sudo tail -f /var/log/squid/access.log
sudo tail -f /var/log/squid/cache.log
```
