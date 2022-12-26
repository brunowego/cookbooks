# PHP iconv

**Keyword:** `ext-iconv`

## Library

### Dependencies

- [phpize](/phpize.md)
- [libiconv](/libiconv.md)

### Installation

#### PHPBrew

```sh
# Homebrew
phpbrew -d ext install \
  --downloader=wget \
  iconv \
  -- \
    --with-iconv="$(brew --prefix libiconv)"

# Linux
phpbrew -d ext install \
  --downloader=wget \
  iconv
```

### Verify

```sh
#
php -m | grep iconv

#
php -i | grep '^iconv$' -A 9
```

### Issues

#### Missing iconv

```log
configure: error: Please specify the install prefix of iconv with --with-iconv=<DIR>
Error: Command failed: ./configure '--with-php-config=~/.phpbrew/php/8.1-dev/bin/php-config' returns: checking for libiconv... no
```

```sh
phpbrew -d install \
  <...> \
  # Homebrew
  +iconv="$(brew --prefix libiconv)"
```
