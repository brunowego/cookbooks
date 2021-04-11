# PHP iconv

## Library

<!-- ### Dependencies

- [phpize](/phpize.md) -->

#### Homebrew

```sh
brew install libiconv
```

### Installation

#### PHPBrew

```sh
# Homebrew
phpbrew -d ext install \
  --downloader=wget \
  iconv \
  -- \
    --with-iconv=$(brew --prefix libiconv)

# Linux
phpbrew -d ext install \
  --downloader=wget \
  iconv
```

### Verify

```sh
php -m | grep iconv
```

```sh
php -i | grep '^iconv$' -A 9
```

### Service

```sh
# FPM
phpbrew fpm restart
```
