# dnsmasq

## Links

- [Wikipedia](https://en.wikipedia.org/wiki/Dnsmasq)

## CLI

### Installation

#### Homebrew

```sh
brew install dnsmasq
```

#### APT

```sh
sudo apt update
sudo apt -y install dnsmasq
```

### Service

#### Homebrew

```sh
brew services list
sudo brew services start dnsmasq

# or
sudo /usr/local/opt/dnsmasq/sbin/dnsmasq --keep-in-foreground -C /usr/local/etc/dnsmasq.conf -7 /usr/local/etc/dnsmasq.d,\*.conf
```

#### Linux

```sh
sudo systemctl disable --now systemd-resolved
sudo systemctl enable --now dnsmasq
```

### Commands

```sh
dnsmasq --help
```

### Issues

#### TBD

```log
dnsmasq: failed to create listening socket for 192.168.237.0: Address already in use
```

<!--
brew cleanup --dry-run
brew cleanup
-->

TODO

## Docker

### Running

```sh
docker run -d \
  -h dnsmasq \
  -e HTTP_USER=admin \
  -e HTTP_PASS=admin \
  -p 53:53/udp \
  -p 8080:8080 \
  --name dnsmasq \
  jpillora/dnsmasq:1.1.0
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```sh
docker rm -f dnsmasq
```
