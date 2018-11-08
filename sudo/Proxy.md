# Proxy

## Keep Variables

```sh
sudo tee /etc/sudoers.d/proxy << EOF
Defaults env_keep += "HTTP_PROXY HTTPS_PROXY FTP_PROXY NO_PROXY"
Defaults env_keep += "http_proxy https_proxy ftp_proxy no_proxy"
EOF
```

### Test

```sh
sudo env | grep 'http_proxy\|https_proxy\|ftp_proxy\|no_proxy'
```
