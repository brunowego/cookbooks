# Advanced Packaging Tool (APT)

## Links

- [Debian Wiki](https://wiki.debian.org/Apt)

## CLI

### Commands

```sh
apt -h
```

### Usage

```sh
# Update
sudo apt update

# Download
apt download <package>

# Repo list
grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/*

# Install
sudo apt -y install <package>

# With Dry Run
sudo apt --dry-run install <package>

# Non interactive
sudo DEBIAN_FRONTEND=noninteractive apt -y install <package>

# Upgrade
sudo apt -y upgrade

# Search
apt search <package>

# Info
apt show <package>

# Show Dependencies
apt rdepends <package>

# Remove
sudo apt remove <package>

# Purge
sudo apt remove --purge <package>

# Clean
sudo apt clean

# Remove lists
sudo rm -r /var/lib/apt/lists/*

# List Installed
apt list --installed

# List Upgradable
apt list --upgradable
```

### Tips

#### Proxy

```sh
sudo tee /etc/apt/apt.conf.d/http-proxy.conf << EOF
Acquire::http::proxy "$http_proxy";
Acquire::https::proxy "$https_proxy";
Acquire::socks::proxy "$no_proxy";
EOF
```

### Issues

#### TBD

```log
The operation couldn’t be completed. Unable to locate a Java Runtime that supports apt.
Please visit http://www.java.com for information on installing Java.
```

TODO

<!-- ```sh
export JAVA_HOME="$(dirname $(dirname $(readlink -f $(which java))))"
export PATH="$JAVA_HOME/bin:$PATH"
``` -->

#### Lock

```log
E: Could not get lock /var/lib/dpkg/lock - open (11 Resource temporarily unavailable)
E: Unable to lock the administration directory (/var/lib/dpkg/) is another process using it?
```

```sh
sudo rm /var/lib/apt/lists/lock
sudo rm /var/lib/dpkg/lock*
sudo rm /var/cache/apt/archives/lock
```

## Docker

### Dockerfile

```Dockerfile
RUN apt-get -qq update && \
      apt-get -qq --no-install-recommends -y install \
        <package>=<version> && \
          apt-get clean && \
            rm -rf /var/lib/apt/lists/*
```
