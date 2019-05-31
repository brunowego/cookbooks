# Locale

## Installation

### APT

```sh
sudo yum check-update
sudo yum -y install locales
```

## Info

```sh
locale -a
```

## Setting

```sh
sudo vim /etc/environment
```

```ini
LANGUAGE=en_US.UTF-8
LANG=en_US.utf-8
LC_ALL=en_US.utf-8
```
