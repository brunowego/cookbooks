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
yum check-update
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

<!-- ###

```sh
ip route | grep '10.96.0.0/12'
```

```sh
sudo ip route add '10.96.0.0/12' via "$(hostname -I | awk '{print $2}')"
```

```sh
sudo ip route del '10.96.0.0/12'
``` -->

<!-- ###

```sh
sudo route add -host github.com -iface en0
sudo route add -host web.whatsapp.com -iface en0
sudo route add -host web.telegram.org -iface en0

ip route | grep '10.96.0.0/12'
``` -->

### Get IP from eth0

```sh
# Darwin
ip route get 1 | awk '{print $NF;exit}'

# Linux
ip route get 1 | awk '{print $7;exit}'
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
