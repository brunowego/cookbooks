# Proxy

<!--
https://github.com/cristianoliveira/ergo
-->

## Links

- [Proxy Servers](https://roadmap.sh/guides/proxy-servers)

## Tools

- [hide.me](https://hide.me/en/proxy)

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
#
export PROXY_HOST='<proxy-host>'

# single
export http_proxy="$PROXY_HOST"

# multiple
export \
  http_proxy="$PROXY_HOST" \
  https_proxy="$PROXY_HOST" \
  no_proxy='localhost,127.0.0.1'
```

- URL: `http://<username>:<password>@<host>:<port>`

### Global

#### Linux

```sh
sudo tee /etc/profile.d/proxy.sh << 'EOF'
# Proxy
export PROXY_HOST="<hostname>"
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
