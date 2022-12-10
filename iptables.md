# iptables

## CLI

### Usage

```sh
#
sudo iptables -t nat -L -n

#
sudo iptables -L INPUT --line-numbers

#
sudo iptables -A INPUT -p tcp --dport <port> -j ACCEPT
sudo iptables -A INPUT -p tcp --dport <port> -j REJECT

#
sudo iptables-save

#
sudo iptables -t nat -A PREROUTING -p tcp --dport 443 -j REDIRECT --to-ports 8443
```
