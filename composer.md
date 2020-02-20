# Composer

<!--
https://typo3.org/article/certificate-issue-with-composer/
-->

## CLI

### References

- [The composer.json Schema](https://getcomposer.org/doc/04-schema.md)

### Installation

#### Homebrew

```sh
brew install composer
```

#### APT

```sh
sudo apt update
sudo apt -y install composer
```

#### YUM

```sh
yum check-update
sudo yum -y install composer-cli
```

#### PHPBrew

```sh
phpbrew -d app get --downloader=wget composer
```

#### Unix-like

```sh
#
curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#
# wget -O - https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
```

#### Chocolatey

```sh
choco install -y composer
```

### Commands

```sh
composer help

# List commands
composer list
```

<!-- ### Configuration

```sh
cat ~/.composer/config.json
``` -->

### Usage

```sh
# Diagnose
composer diagnose

# Create
composer create-project --prefer-dist laravel/laravel [name] && "$_"

# Install
composer install

#
composer install \
  --prefer-dist \
  -vvv \
  --profile

# Update
composer update

# Config
## List Local
composer config -l

## List Global
composer config -gl

# Disable Packagist
composer config repo.packagist.org false

# Set Repo
composer config repo.packagist composer https://packagist.org
composer config secure-http false

# Search
composer search monolog

# Show
composer show monolog/monolog

# Unset Repo
composer config --unset repos.packagist

# Cache
composer clear-cache

# Archive
composer archive -f zip
```

### Tips

#### Proxy

```sh
composer diagnose
```

#### Command-line completion

```sh
# Using Oh My Zsh
sed -ri 's/^plugins=\((.*)\)/plugins=\(\1 composer\)/g' ~/.zshrc

source ~/.zshrc

rm ~/.zcompdump*
```

### Issues

<!-- ####

```log
Failed to download php-console/php-console from dist: The "https://api.github.com/repos/barbushin/php-console/zipball/aa1d71d4ea3dc91e126edc9aa4f3c10eb8559cff" file could not be downloaded: SSL operation failed with code 1. OpenSSL Error messages:
error:14090086:SSL routines:ssl3_get_server_certificate:certificate verify failed
failed to open stream: Cannot connect to HTTPS server through proxy
```

```sh
composer config secure-http false
``` -->
