# Proxy

## List of Variables

- `http_proxy`
- `https_proxy`
- `ftp_proxy`
- `socks_proxy`
- `rsync_proxy`
- `all_proxy`
- `no_proxy`

> The environment variable `HTTP_PROXY` is discouraged. Use `http_proxy` instead.

## Set

```sh
# single
export http_proxy=[URL]

# multiple
export \
  http_proxy=[URL] \
  https_proxy=[URL] \
  no_proxy=localhost,127.0.0.1
```

- URL: `http://[username]:[password]@[host]:[port]`

### Global

#### Linux

```sh
sudo tee /etc/profile.d/proxy.sh << 'EOF'
# Proxy
export PROXY_HOST="[hostname]"
export PROXY_PORT="3128"

# HTTP(S) Proxy
export http_proxy="http://$PROXY_HOST:$PROXY_PORT"
export https_proxy="$http_proxy"
export no_proxy="localhost,127.0.0.1"
EOF
```

```sh
sudo su - "$USER"
```

## Unset

```sh
# single
unset http_proxy

# multiple
unset http_proxy https_proxy no_proxy
```

## Tips

### Print Proxy

```sh
env | grep -i _proxy= | sort
```
