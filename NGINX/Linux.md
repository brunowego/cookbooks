# Linux

## Installation

### YUM

```sh
sudo yum check-update
sudo yum -y install epel-release
sudo yum -y install nginx
```

### APT

```sh
sudo apt update
sudo apt -y install nginx
```

## Service

```sh
sudo systemctl enable --now nginx
```

## Logs

```sh
sudo chmod -R +rx /var/log/nginx
```

```sh
tail -f /var/log/nginx/access.log
```

```sh
tail -f /var/log/nginx/error.log
```
