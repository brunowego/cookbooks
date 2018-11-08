# Proxy

## Network

```sh
sudo sed -ri '/^export no_proxy=/s|"(.*)"|"\1,10.244.0.0/16"|g' /etc/profile.d/no-proxy.sh
```
