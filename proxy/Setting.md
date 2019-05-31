# Setting

## Environment

```sh
export PROXY_HOST="[hostname]"
export PROXY_PORT="3128"
export http_proxy="http://$PROXY_HOST:$PROXY_PORT" https_proxy="http://$PROXY_HOST:$PROXY_PORT"
export no_proxy="localhost,127.0.0.1"
```

## Persist

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
sudo su - $USER
```
