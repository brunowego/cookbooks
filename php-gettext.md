# PHP Gettext

## Dependencies

- [Gettext](/gettext.md)

## Installation

### PHPBrew

<!-- ```sh
sudo find / -name libintl.h
``` -->

```sh
phpbrew -d ext install \
  --downloader=wget \
  gettext \
  -- \
    --with-gettext=$(brew --prefix gettext)
```

## Verify

```sh
php -m | grep gettext
```

```sh
php -i | grep -i gettext
# php -i | grep '^gettext$' -A 14
```

## Service

```sh
# FPM
phpbrew fpm restart
```
