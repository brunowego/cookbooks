# INTL

## Dependencies

```sh
brew tap magrathealabs/mlabs
brew install icu4c@58.1
```

```sh
brew link icu4c@58.1 --force
```

## Installation

```sh
phpbrew --debug ext install intl -- --with-icu-dir=$(brew --prefix icu4c@58.1)
```

## Verify

```sh
php -m | grep intl
```

```sh
php -i | grep intl
```
