# Advanced Packaging Tool (APT)

## Commands

```sh
apt -h
```

## Usage

```sh
# Update
sudo apt update

# Download
apt download [package]

# Repo list
grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/*

# Install
sudo apt -y install [package]

# Non interactive
DEBIAN_FRONTEND=noninteractive sudo apt -y install [package]

# Upgrade
sudo apt -y upgrade

# Search
apt search [package]

# Info
apt show [package]

# Show Dependencies
apt rdepends [package]

# Remove
sudo apt remove [package]

# Purge
sudo apt remove --purge [package]

# Clean
sudo apt clean

# Remove lists
sudo rm -r /var/lib/apt/lists/*

# List Installed
apt list --installed

# List Upgradable
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
    apt --no-install-recommends -y install [package]=[version] && \
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
