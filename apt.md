# Advanced Packaging Tool (APT)

## Commands

```sh
apt -h
```

## Usage

### Update

```sh
sudo apt update
```

### Install

```sh
sudo apt -y install [package]
```

### Upgrade

```sh
sudo apt -y upgrade
```

### Search

```sh
apt search [package]
```

### Info

```sh
apt show [package]
```

### Show Dependencies

```sh
apt rdepends [package]
```

### Remove

```sh
sudo apt remove [package]

# Purge
sudo apt remove --purge [package]
```

### Clean

```sh
sudo apt clean

# Remove lists
sudo rm -r /var/lib/apt/lists/*
```

### List

```sh
# Installed
apt list --installed

# Upgradable
apt list --upgradable
```

## Issues

### Lock

```log
E: Could not get lock /var/lib/dpkg/lock - open (11 Resource temporarily unavailable)
E: Unable to lock the administration directory (/var/lib/dpkg/) is another process using it?
```

```sh
sudo rm /var/lib/apt/lists/lock
sudo rm /var/lib/dpkg/lock*
sudo rm /var/cache/apt/archives/lock
```

## Tips

### Dockerfile

```Dockerfile
RUN apt update && \
    apt --no-install-recommends -y install [package]=[version] \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
```

### Proxy

```sh
sudo tee /etc/apt/apt.conf.d/http-proxy.conf << EOF
Acquire::http::proxy "$http_proxy";
Acquire::https::proxy "$https_proxy";
Acquire::socks::proxy "$no_proxy";
EOF
```
