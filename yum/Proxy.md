# Proxy

> You may not need to configure the proxy, before continuing, try keep variables between the current user and sudo user.

## Configuration

```sh
sudo sh -c "echo 'proxy=http://$PROXY_HOST:$PROXY_PORT' >> /etc/yum.conf"
```

### With auth

```sh
sudo tee -a /etc/yum.conf << EOF
proxy_username=$PROXY_USERNAME
proxy_password=$PROXY_PASSWORD
EOF
```

## Test

```sh
yum repolist
```
