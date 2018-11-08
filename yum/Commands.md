# Commands

## Update

```sh
sudo yum check-update
```

```sh
sudo yum -y update
```

## Search

```sh
sudo yum search [package]
```

## Install

```sh
sudo yum -y install [package]
```

### No plugins

```sh
sudo yum install --noplugins -y [package]
```

### Disable plugin

```sh
sudo yum install --disableplugin=fastestmirror -y [package]
```

## Info

```sh
sudo yum info [package]
```

## Show dependencies

```sh
sudo yum deplist [package]
```

## Repository

```sh
sudo vim /etc/yum.repos.d/[name].repo
```

## Erase

```sh
sudo yum erase [package]
```

## Clean

```sh
sudo yum clean all
sudo rm -r /var/cache/yum/*
```

## Repository list

```sh
yum repolist
```

## Show

```sh
sudo yum list
```

### Installed

```sh
sudo yum list installed
```
