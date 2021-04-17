# Proxy

## Show

```sh
git config --global http.proxy
git config --global https.proxy
```

## Setting

```sh
#
export http_proxy=
export https_proxy=

# Local
git config http.proxy "$http_proxy"
git config https.proxy "$https_proxy"

# or
git config http.proxy 'http://[hostname]/proxy.pac'
git config https.proxy 'http://[hostname]/proxy.pac'

# Global
git config --global http.proxy "$http_proxy"
git config --global https.proxy "$https_proxy"

# or
git config --global http.proxy 'http://[hostname]/proxy.pac'
git config --global https.proxy 'http://[hostname]/proxy.pac'
```

## Bypass

```sh
git config --global http.proxy ''
git config --global https.proxy ''
```

## Unsetting

```sh
git config --global --unset http.proxy
git config --global --unset https.proxy
```

## Use HTTPS instead of SSH

```sh
git config --global url.'https://'.insteadOf git://
```

## Issues

###

```log
gnutls_handshake() failed: Error in the pull function.
```

Just set proxy.
