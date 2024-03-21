# .localhost as TLD

## Configuration

```sh
# Homebrew
mkdir -p "$(brew --prefix)/etc/dnsmasq.d"

sudo bash -c 'echo "address=/.localhost/127.0.0.1" > "$(brew --prefix)/etc/dnsmasq.d/localhost.conf"'

cat << EOF | sudo tee -a "$(brew --prefix)/etc/dnsmasq.conf"

conf-dir=$(brew --prefix)/etc/dnsmasq.d/,*.conf
EOF

dnsmasq --test
```

## Resolver

```sh
sudo mkdir -p /etc/resolver

sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/localhost'

sudo brew services restart dnsmasq

scutil --dns
```

## Test

```sh
dnsmasq --test

pgrep dnsmasq >/dev/null && echo 'running' || echo 'not running'

dig test.localhost @127.0.0.1

ping -c 1 google.com
ping -c 1 test.localhost
```
