# PHP Extension and Application Repository (PEAR)

## CLI

### Installation

#### APT

```sh
sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt -y install php-pear
```

#### APT

```sh
yum check-update
sudo yum -y install php-pear
```

#### APK

```sh
apk update
apk add php7-pear
```

#### Unix-like

```sh
curl -O https://pear.php.net/go-pear.phar
sudo php -d detect_unicode=0 ./go-pear.phar
```

1. Type `1` and press `return`
2. Enter: `/usr/local/pear`
3. Type `4` and press `return`
4. Enter: `/usr/local/bin`
5. Press `return`

```sh
rm go-pear.phar
```

### Commands

```sh
pear help
```

### Usage

```sh
# List
pear list

# Upgrade
pear upgrade pear

# Config Show
pear config-show

# Search
pear search [package]
```

### Tips

#### Proxy

```sh
#
pear config-get http_proxy

#
pear config-set http_proxy ''

#
pear config-set http_proxy "$http_proxy"
```

### Uninstall

```sh
sudo rm -fR /usr/local/pear
sudo rm /usr/local/bin/{pear,peardev,pecl}
```
