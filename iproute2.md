# iproute2

## References

- [Supported commands / Example usage](https://github.com/brona/iproute2mac#supported-commands--example-usage)

## Installation

### Homebrew

```sh
brew install iproute2mac
```

### YUM

```sh
sudo yum check-update
sudo yum -y install iproute
```

### APT

```sh
sudo apt update
sudo apt -y install iproute2
```

### APK

```sh
sudo apk update
sudo apk add iproute2
```

## Examples

### Get IP from eth0

```sh
ip route get 1 | awk '{print $NF;exit}'
```

### Delete

```sh
sudo ip addr del [addr] dev [name]
```

```sh
sudo ip link delete [device]
```

## Commands

```sh
ip help
```
