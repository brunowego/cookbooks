# phpcov

## CLI

### Installation

#### PHPBrew

```sh
phpbrew -d app get --downloader=wget phpcov
```

#### Unix-like

```sh
# GNU Wget
wget -O /usr/local/bin/phpcov 'https://phar.phpunit.de/phpcov.phar' && \
  chmod +x /usr/local/bin/phpcov

# cURL
curl -L 'https://phar.phpunit.de/phpcov.phar' -o /usr/local/bin/phpcov && \
  chmod +x /usr/local/bin/phpcov
```

### Commands

```sh
phpcov -h
```
