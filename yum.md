# Yellowdog Updater, Modified (YUM)

## Commands

```sh
yum -h
```

## Examples

### Update

```sh
yum check-update
```

```sh
sudo yum -y update
```

### Search

```sh
yum search [package]
```

### Install

```sh
sudo yum -y install [package]
```

#### No plugins

```sh
sudo yum install --noplugins -y [package]
```

#### Disable plugin

```sh
sudo yum install --disableplugin=fastestmirror -y [package]
```

### Info

```sh
yum info [package]
```

### Show dependencies

```sh
yum deplist [package]
```

### Repository

```sh
sudo vim /etc/yum.repos.d/[name].repo
```

### Erase

```sh
sudo yum erase [package]
```

### Clean

```sh
sudo yum clean all
sudo rm -fR /var/cache/yum/*
```

### Repository list

```sh
yum repolist
```

### List

```sh
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
RUN yum -y install [package]-[version]
```

### Proxy

```log
You may not need to configure the proxy, before continuing, try keep variables between the current user and sudo user.
```

```sh
# Configuration
sudo /usr/bin/sh -c "echo 'proxy=$http_proxy' >> /etc/yum.conf"

# Or
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
sudo sed -i 's/^#exclude=.*/exclude=centos.example.com/' /etc/yum/pluginconf.d/fastestmirror.conf

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
