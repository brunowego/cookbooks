# Pipe Viewer

## Installation

### Homebrew

```sh
brew install pv
```

### YUM

```sh
yum check-update
sudo yum -y install pv
```

## Commands

```sh
pv -h
```

## Examples

### MySQL

```sh
pv [filename.sql] | mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -u [username] \
  -p[password] \
  [database]
```
