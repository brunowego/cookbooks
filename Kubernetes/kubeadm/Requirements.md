# Requirements

## Security-Enhanced Linux

```sh
sudo setenforce 0
```

```sh
sudo sed -i '/^SELINUX=/s/enforcing/permissive/' /etc/selinux/config
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

## SWAP

```sh
sudo swapoff -a
```

```sh
sudo sed -i '/ swap /s/^\(.*\)$/# \1/g' /etc/fstab
```
