# Commands

##

```sh
sudo iptables -t nat -L -n
```

```sh
sudo iptables -L INPUT --line-numbers
```

##

```sh
sudo iptables -A INPUT -p tcp --dport [port] -j ACCEPT
sudo iptables -A INPUT -p tcp --dport [port] -j REJECT
```

##

```sh
sudo iptables-save
```

##

```sh
sudo iptables -t nat -A PREROUTING -p tcp --dport 443 -j REDIRECT --to-ports 8443
```
