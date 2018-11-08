# SQLite

## Dependencies

### Homebrew

```sh
brew install gd
```

## Installation

```sh
phpbrew --debug ext install sqlite3
```

## Verify

```sh
php -m | grep sqlite3
```

```sh
php -i | grep sqlite3
```
