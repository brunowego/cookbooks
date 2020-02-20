# PHPUnit

<!--
https://github.com/search?p=3&q=filename%3Aphpunit.md+%22phpunit.xml%22&type=Code
https://github.com/HorseLuke/php-dg24framework_framework-base-minimal/blob/8f2cfbbfda535a3ebcc221e2eb44c6ad92905d92/tests/phpunit.md
-->

## CLI

### Installation

#### Homebrew

```sh
brew install phpunit
```

#### PHPBrew

```sh
phpbrew -d app get --downloader=wget phpunit
```

#### Unix-like

```sh
# GNU Wget
wget -O /usr/local/bin/phpunit 'https://phar.phpunit.de/phpunit.phar' && \
  chmod +x /usr/local/bin/phpunit

# cURL
curl -L 'https://phar.phpunit.de/phpunit.phar' -o /usr/local/bin/phpunit && \
  chmod +x /usr/local/bin/phpunit
```

### Commands

```sh
phpunit -h
```

### Configuration

```sh
# Git ignore
echo '.phpunit.result.cache' >> ~/.gitignore_global
```

### Usage

```sh
phpunit \
  --verbose \
  --debug
```
