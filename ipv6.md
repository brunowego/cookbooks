# IPv6

## Tips

### Disable

```sh
# Darwin
sudo networksetup -listallhardwareports

networksetup -getinfo '[hardware-port]' # Thunderbolt Ethernet, Wi-Fi

sudo networksetup -setv6off '[hardware-port]' # Thunderbolt Ethernet, Wi-Fi

#
sudo sed -i 's/^::1/# &/' /etc/hosts
```
