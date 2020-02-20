# PHP Code Beautifier and Fixer

## CLI

### Dependencies

- [PEAR](/pear.md)

### Installation

#### PHPBrew

```sh
phpbrew -d app get --downloader=wget phpcbf
```

### Verify

```sh
phpcbf -i
```

### Commands

```sh
phpcbf -h
```

### Configuration

```sh
phpcbf --config-show

# Default Standard
phpcbf --config-set default_standard PSR2
```

### Usage

```sh
phpcbf ./
```
