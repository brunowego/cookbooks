# Proxy

## HTTP(S)

```sh
tee -a ~/.gemrc << EOF
http_proxy: http://$PROXY_HOST:$PROXY_PORT
https_proxy: http://$PROXY_HOST:$PROXY_PORT
EOF
```

## Authentication

```sh
tee -a ~/.gemrc << EOF
http_proxy_user: $PROXY_USERNAME
http_proxy_pass: $PROXY_PASSWORD
https_proxy_user: $PROXY_USERNAME
https_proxy_pass: $PROXY_PASSWORD
EOF
```

## Test

```sh
gem env
```
