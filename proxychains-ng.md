# ProxyChains-NG

## CLI

### Installation

#### Homebrew

```sh
brew install proxychains-ng
```

#### APT

```sh
sudo apt update
sudo apt -y install proxychains4
```

#### YUM

```sh
yum check-update
sudo yum -y install proxychains
```

#### Zypper

```sh
sudo zypper refresh
sudo zypper install -y proxychains-ng
```

### Standardization

```sh
# Ubuntu
sudo ln -s /usr/bin/proxychains4 /usr/local/bin/proxychains

# Darwin
sudo ln -s /usr/local/bin/proxychains4 /usr/local/bin/proxychains
```

### Configuration

```sh
#
mkdir -p ~/.proxychains

#
cat << EOF > ~/.proxychains/proxychains.conf
strict_chain

proxy_dns

tcp_read_time_out 15000
tcp_connect_time_out 8000

localnet 127.0.0.0/255.0.0.0

[ProxyList]
http   127.0.0.1 8080 [username] [password]
socks4 127.0.0.1 1080 [username] [password]
socks5 127.0.0.1 1080 [username] [password]
EOF
```

### Usage

```sh
#
curl -I github.com

proxychains curl -I github.com

#
nmap -p 80,443 github.com

proxychains nmap \
  -p 80,443 \
  github.com
```
