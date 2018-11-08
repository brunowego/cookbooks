# PostgreSQL

## Dependencies

### Homebrew

```sh
brew install postgresql
```

## Installation

```sh
phpbrew --debug ext install pgsql
```

## Verify

```sh
php -m | grep pgsql
```

```sh
php -i | grep pgsql
```
