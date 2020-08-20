# PacGen

## CLI

### Installation

#### PIP

```sh
pip install -U pacgen
```

### Configuration

```sh
cat << EOF > ~/.pacgen.yml
proxies:
  ssh_tunnel: socks5://127.0.0.1:1081
  shadowsocks: socks5://127.0.0.1:1080
  squid_proxy: http://127.0.0.1:3128
  no_proxy: direct
routes:
  172.19.20.10: ssh_tunnel
  youtube.com: shadowsocks
  viemo.com: shadowsocks
  news.com: squid_proxy
default_proxy: no_proxy
excludes:
  - bank.com
  - lastpass.com
EOF
```

### Usage

```sh
updatepac
```
