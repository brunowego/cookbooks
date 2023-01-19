# Yellowdog Updater, Modified (YUM)

## Commands

```sh
yum -h
```

## Repositories

### Extra Packages for Enterprise Linux (EPEL)

```sh
yum check-update
sudo yum -y install epel-release
```

### Software Collections

```sh
yum check-update
sudo yum -y install centos-release-scl
```

### Webtatic (Includes EPEL)

```sh
yum check-update
sudo yum -y localinstall https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
```

## Usage

```sh
# Update
yum check-update
sudo yum -y update

# Search
yum search [package]

# Install
sudo yum -y install [package]

# No plugins
sudo yum install --noplugins -y [package]

# Disable plugin
sudo yum install --disableplugin=fastestmirror -y [package]

# Info
yum info [package]

# Show dependencies
yum deplist [package]

# Repository
sudo vim /etc/yum.repos.d/[name].repo

# Erase
sudo yum erase [package]

# Clean
sudo yum clean all
sudo rm -fR /var/cache/yum/*

# Repository list
yum repolist

# List
yum list

# Installed
yum list installed

# Show Duplicates
yum --showduplicates list [package-name] | expand

# Or
yum list [package-name] --showduplicates | sort -r
```

## Issues

### Lock

```log
Another app is currently holding the yum lock; waiting for it to exit...
```

```sh
sudo rm -f /run/yum.pid
```

## Tips

### Dockerfile

```Dockerfile
RUN yum -y install \
      [package]-[version] && \
    yum -y clean all && \
      rm -rf /var/cache
```

### Proxy

```log
You may not need to configure the proxy, before continuing, try keep variables between the current user and sudo user.
```

```sh
# With environment
sudo /usr/bin/sh -c "echo 'proxy=$http_proxy' >> /etc/yum.conf"

# With host and port environment
sudo /usr/bin/sh -c "echo 'proxy=http://$PROXY_HOST:$PROXY_PORT' >> /etc/yum.conf"

# With auth
sudo tee -a /etc/yum.conf << EOF
proxy_username=$PROXY_USERNAME
proxy_password=$PROXY_PASSWORD
EOF

# Test
yum repolist
```

### FastestMirror

```sh
# Disable fastestmirror
sudo sed -ie '/^enabled=/ s/1/0/g' /etc/yum/pluginconf.d/fastestmirror.conf

# Exclude
sudo sed -i 's/^#exclude=.*/exclude=centos.domain.tld/' /etc/yum/pluginconf.d/fastestmirror.conf

# Include only
sudo sed -i 's/^#include_only=.*/include_only=.com/' /etc/yum/pluginconf.d/fastestmirror.conf

# Timed Hosts Remove
sudo rm /var/cache/yum/x86_64/7/timedhosts*
```

### Enable/Disable Repositories

```sh
# Enable
sudo sed -ie '/^enabled=/ s/0/1/g' /etc/yum.repos.d/*.repo

# Disable
sudo sed -ie '/^enabled=/ s/1/0/g' /etc/yum.repos.d/*.repo
```

## Logs

```sh
sudo tail -f /var/log/yum.log
```
