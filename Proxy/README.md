# Proxy

## List of Variables

- `http_proxy`
- `https_proxy`
- `no_proxy`

- `ftp_proxy`
- `rsync_proxy`

> The environment variable `HTTP_PROXY` is discouraged. Use `http_proxy` instead.

## Set

```sh
export \
  http_proxy=[URL] \
  https_proxy=[URL] \
  no_proxy=localhost,127.0.0.1
```

- URL: `http://[username]:[password]@[host]:[port]`

## Unset

```sh
unset http_proxy https_proxy no_proxy
```
