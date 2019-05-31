# Examples

## Update

```sh
sudo apt update
```

## Install

```sh
sudo apt -y install [package]
```

## Upgrade

```sh
sudo apt upgrade -y
```

## Search

```sh
sudo apt search [package]
```

## Info

```sh
sudo apt-cache show [package]
```

## Show Dependencies

```sh
apt-cache rdepends [package]
```

## Remove

```sh
sudo apt remove [package]
```

### Purge

```sh
sudo apt remove --purge [package]
```

## Clean

```sh
sudo apt clean
```

### Remove

```sh
sudo rm -r /var/lib/apt/lists/*
```

## List

### Installed

```sh
sudo apt list --installed
```

### Upgradable

```sh
sudo apt list --upgradable
```
