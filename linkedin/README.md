# LinkedIn

<!--
1584/396 pixels
-->

## Links

- [Following](https://linkedin.com/feed/following/)
- [Social Selling Index (SSI)](https://linkedin.com/sales/ssi)
- [Invitation Sent](https://linkedin.com/mynetwork/invitation-manager/sent/)

## Tips

### Dark Mode

1. [Settings / Account preferences](https://linkedin.com/mypreferences/d/categories/account)
2. Display -> Dark mode

### Force Specific Network Interface

```sh
# List
netstat -rn | grep -i default

# Route Info
route get linkedin.com
ping 108-174-12-129.fwd.linkedin.com

# Add Route
sudo route add 108.174.12.129 172.20.10.1

#
netstat -rn | grep -i 108.174.12.129

# Check Route
route get linkedin.com

# Delete
sudo route delete 108.174.12.129 172.20.10.1
```

## Issues

### Proxy

Bypass external proxies for the following hosts:

```txt
*.linkedin.com
```
