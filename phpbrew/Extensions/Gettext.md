# Gettext

## Dependencies

### Homebrew

```sh
brew install gettext
```

## Installation

```sh
sudo find / -name libintl.h
```

```sh
phpbrew --debug ext install gettext -- --with-gettext=$(brew --prefix gettext)
```

## Verify

```sh
php -m | grep gettext
```

```sh
php -i | grep gettext
```
