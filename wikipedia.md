# Wikipedia

## Tips

### Force Specific Network Interface

```sh
# List
netstat -rn | grep -i default

# Route Info
route get www.wikipedia.org
ping text-lb.eqiad.wikimedia.org

# Add Route
sudo route add 208.80.154.224 172.20.10.1

#
netstat -rn | grep -i 208.80.154.224

# Check Route
route get www.wikipedia.org

# Delete
sudo route delete 208.80.154.224 172.20.10.1
```

## Issues

### Proxy

Bypass external proxies for the following hosts:

```txt
*.wikipedia.org
```
