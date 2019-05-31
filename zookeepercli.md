# zookeepercli

## Installation

### OS X Binary

```sh
curl -L 'https://github.com/outbrain/zookeepercli/releases/download/v1.0.12/zookeepercli-osx-darwin-binary.tar.gz' | tar -xzC /usr/local/bin
```

```sh
chmod +x /usr/local/bin/zookeepercli
```

## Commands

```sh
zookeepercli -h
```

## Examples

### List

```sh
zookeepercli --servers [hostname]:2182 -c ls /
```

### Create

```sh
zookeepercli --servers [hostname]:2182 -c create /[path] [value]
```

### Get

```sh
zookeepercli --servers [hostname]:2182 --format=json -c get /[path]
```
