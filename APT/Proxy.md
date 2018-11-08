# Proxy

## Configuration

```sh
sudo tee -a /etc/apt/apt.conf.d/http-proxy.conf << EOF
Acquire::http::proxy "$http_proxy";
Acquire::https::proxy "$https_proxy";
Acquire::socks::proxy "$no_proxy";
EOF
```
