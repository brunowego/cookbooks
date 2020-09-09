# iproute2

## References

- [Supported commands / Example usage](https://github.com/brona/iproute2mac#supported-commands--example-usage)

## CLI

### Installation

#### Homebrew

```sh
brew install iproute2mac
```

#### YUM

```sh
yum check-update
sudo yum -y install iproute
```

#### APT

```sh
sudo apt update
sudo apt -y install iproute2
```

#### APK

```sh
sudo apk update
sudo apk add iproute2
```

### Usage

```sh
#
ip route | grep '10.96.0.0/12'

#
sudo ip route add '10.96.0.0/12' via "$(hostname -I | awk '{print $2}')"

#
sudo ip route del '10.96.0.0/12'

# IP eth0

ip route get 1 | awk '{print $NF;exit}' # Darwin
ip route get 1 | awk '{print $7;exit}' # Linux

#
sudo ip addr del [addr] dev [name]

#
sudo ip link delete [device]
```

## Commands

```sh
ip help
```

## Tips

<!-- ###

```sh
#
sudo route add -host github.com -iface en0
sudo route add -host web.whatsapp.com -iface en0
sudo route add -host web.telegram.org -iface en0

#
ip route | grep '10.96.0.0/12'
``` -->

<!-- ###

```sh
ip -4 addr show dev ppp0

ip link list
ip route list

dig +short [domain] | tail -n 1

$ ip route get x.x.x.x
x.x.x.x dev ppp0  src x.x.x.x

$ ip route get x.x.x.x
x.x.x.x dev ppp0  src x.x.x.x

sudo route -n flush

ip route add x.x.x.x/16 dev ppp0

ip route del x.x.x.x/16

curl http://x.x.x.x/proxy.pac

ping x.x.x.x
nslookup x.x.x.x
``` -->
