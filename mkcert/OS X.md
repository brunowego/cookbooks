# OS X

## Installation

### Homebrew

```sh
brew install mkcert
brew install nss # if you use Firefox
```

## Configuration

```sh
mkcert -install
```

```sh
mkdir -p /usr/local/etc/nginx/certs
cd /usr/local/etc/nginx/certs
```

```sh
mkcert localhost 127.0.0.1 ::1
```
