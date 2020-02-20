# Commands

## Plugins

### Proxy

```sh
mysql-proxy \
  --plugins=proxy \
  --proxy-lua-script=[/absolute/path/to/script.lua]
```

## Connect

```sh
mysql -h 127.0.0.1 -P 4040 -u root -p
```
