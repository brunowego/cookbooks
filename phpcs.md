# PHP CodeSniffer

## CLI

### Dependencies

- [PEAR](/pear.md)

### Installation

#### PEAR

```sh
pear install PHP_CodeSniffer
```

#### PHPBrew

```sh
phpbrew -d app get --downloader=wget phpcs
```

### Verify

```sh
phpcs -i
```

### Commands

```sh
phpcs -h
phpcbf -h
```

### Configuration

```sh
phpcs --config-show

# Default Standard
phpcs --config-set default_standard PSR2
```

### Usage

```sh
phpcs \
  -d memory_limit=8G \
  -vvv \
  ./
```

### Docs

#### PhpStorm

Set path of `phpcs`:

1. File
2. Default Settings
3. Languages & Frameworks
4. PHP
5. Code Sniffer

Check Code Sniffer validation:

1. File
2. Default Settings
3. Editor
4. Inspections
5. PHP
6. PHP Code Sniffer validation`
7. Go to `Coding standard` and select the default standard.
