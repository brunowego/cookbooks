# Cloudera

## Requirements

### Disable Security-Enhanced (SE) Linux

```sh
#
sudo setenforce 0

#
sudo sed -i '/^SELINUX=/ s/enforcing/permissive/' /etc/selinux/config
```

### User Process Limit

```sh
#
ulimit -u

#
sudo sed -i 's/#DefaultLimitNOFILE=/DefaultLimitNOFILE=65536/g' /etc/systemd/system.conf
sudo sed -i 's/#DefaultLimitNOFILE=/DefaultLimitNOFILE=65536/g' /etc/systemd/user.conf
```
