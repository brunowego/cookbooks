# PHP Document Object Model (DOM)

## Installation

### PHPBrew

```sh
# Homebrew
phpbrew -d ext install \
  --downloader=wget \
  dom
```

## Verify

```sh
#
php -m | grep dom

#
php -i | grep '^dom$' -A 9
```
