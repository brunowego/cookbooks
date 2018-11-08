# Examples

## Get IP

### eth0

```sh
ip route get 1 | awk '{print $NF;exit}'
```

## Delete

```sh
sudo ip addr del [addr] dev [name]
```

```sh
sudo ip link delete [device]
```
