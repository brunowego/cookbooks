# LinkedIn

## References

- [Social Selling Index (SSI)](https://www.linkedin.com/sales/ssi)

## Tips

### Force Specific Network Interface

```sh
# List
netstat -rn | grep -i default

# Route Info
route get www.linkedin.com
ping 108-174-12-129.fwd.linkedin.com

# Add Route
sudo route add 108.174.12.129 172.20.10.1

#
netstat -rn | grep -i 108.174.12.129

# Check Route
route get www.linkedin.com

# Delete
sudo route delete 108.174.12.129 172.20.10.1
```

## Issues

### Proxy

Bypass external proxies for the following hosts:

```txt
*.linkedin.com
```
