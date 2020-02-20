# dnsmasq

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

### Commands

```sh
dnsmasq --help
```

### Configuration

```sh
sudo mkdir -p /usr/local/etc/dnsmasq.d
```

```sh
sudo bash -c 'echo "address=/.example.com/[ip]" > /usr/local/etc/dnsmasq.d/example.conf'
```

```sh
# Linux
cat << EOF | sudo tee /etc/dnsmasq.conf
conf-dir=/usr/local/etc/dnsmasq.d/,*.conf
EOF

# Darwin
cat << EOF | sudo tee $(brew --prefix)/etc/dnsmasq.conf
conf-dir=/usr/local/etc/dnsmasq.d/,*.conf
EOF
```

### Service

#### Linux

```sh
sudo systemctl disable --now systemd-resolved
sudo systemctl enable --now dnsmasq
```

#### Homebrew

```sh
sudo brew services start dnsmasq
```

### Resolver

```sh
sudo mkdir -p /etc/resolver
```

```sh
sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/example.com'
```

```sh
# Linux
sudo systemctl restart dnsmasq

# Darwin
sudo brew services restart dnsmasq
```

### Test

```sh
dnsmasq --test
```

```sh
pgrep dnsmasq > /dev/null && echo 'running' || echo 'not running'
```

```sh
dig this.is.a.example.com @127.0.0.1
```

```sh
ping -c 1 google.com
ping -c 1 this.is.a.example.com
```
