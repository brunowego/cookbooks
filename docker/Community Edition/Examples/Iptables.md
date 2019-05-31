# Iptables

```sh
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

iptables -A INPUT -i lo -j ACCEPT
```

```sh
iptables -A INPUT -i docker0 -j ACCEPT
```

```sh
iptables-A FORWARD -i docker0 -o eth0 -j ACCEPT
iptables-A FORWARD -i eth0 -o docker0 -j ACCEPT
```
