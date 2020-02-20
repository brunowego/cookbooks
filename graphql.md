# GraphQL

## Host

### Tips

#### Caddy Configuration

```sh
# Homebrew
cat << EOF > /usr/local/etc/Caddyfile
:80 {
  proxy / 127.0.0.1:8080 {
    websocket
  }
}
EOF
```

```sh
# Homebrew
brew services restart caddy
```
