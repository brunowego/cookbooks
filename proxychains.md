# ProxyChains

## CLI

### Installation

#### APT

```sh
sudo apt update
sudo apt -y install proxychains
```

### Configuration

```sh
cat << EOF > ./proxychains.conf
strict_chain
proxy_dns
remote_dns_subnet 224
tcp_read_time_out 15000
tcp_connect_time_out 8000
localnet 127.0.0.0/255.0.0.0
quiet_mode

[ProxyList]
socks5  127.0.0.1 1080
EOF
```

### Usage

```sh
proxychains wget https://www.google.com
```
