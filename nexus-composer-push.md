# Nexus Push command for composer

## CLI

### Requirements

- [Nexus Repository Composer](/nexus-repository-composer.md)

### Installation

#### Composer

```sh
composer require elendev/nexus-composer-push
```

### Usage

```sh
composer nexus-push \
  --username=admin \
  --password=admin123 \
  --url=http://127.0.0.1:8081/repository/composer \
  --ignore=test.php \
  --ignore=foo/ \
  0.0.1
```
