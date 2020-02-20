# Tips

## Disable IPv6

```sh
sudo /usr/bin/sh -c 'echo "net.ipv6.conf.eth0.disable_ipv6 = 1" >> /etc/sysctl.d/40-ipv6.conf'
```

```sh
sudo sysctl --system
```

## iptables

```sh
cat << EOF | sudo tee /etc/sysctl.d/90-bridge.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
```

```sh
sudo sysctl --system
```

## Enable BBR

```sh
cat << EOF | sudo tee /etc/sysctl.d/66-bbr.conf
net.core.default_qdisc = fq
net.ipv4.tcp_congestion_control = bbr
EOF
```

```sh
sudo sysctl --system
```
