# Proxy

## Show

```sh
git config --global http.proxy
git config --global https.proxy
```

## Setting

```sh
git config --global http.proxy "$http_proxy"
git config --global https.proxy "$https_proxy"
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
