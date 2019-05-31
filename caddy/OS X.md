# OS X

## Installation

### Homebrew

```sh
brew install caddy
```

## Configuration

```sh
/usr/libexec/PlistBuddy -c 'Print :ProgramArguments' /usr/local/opt/caddy/homebrew.mxcl.caddy.plist
```

```sh
sudo mkdir -p /var/www/html
```

```sh
sudo tee -a /usr/local/etc/Caddyfile << EOF
:80 {
  root /var/www/html
  browse
}
EOF
```

## Service

### Homebrew

```sh
brew services start caddy
```
