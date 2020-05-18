# IPv6

## Tips

### Disable

```sh
# Darwin
sudo networksetup -listallhardwareports

sudo networksetup -setv6off '[hardware-port]' # Thunderbolt Ethernet, Wi-Fi
```

```sh
#
sudo sed -i 's/^::1/# &/' /etc/hosts
```
