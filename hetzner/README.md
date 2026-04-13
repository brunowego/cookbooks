# Hetzner

**Keywords:** Cloud Provider

<!--
https://www.youtube.com/watch?v=q241nOF246o
-->

## Links

- [Main Website](https://hetzner.com)
- [Console](https://console.hetzner.cloud)

## Configuration

**Dependencies:** [ssh-keygen](/ssh/ssh-keygen.md)

```sh
#
chmod 600 ~/.ssh/id_rsa.hetzner

#
ssh-add ~/.ssh/id_rsa.hetzner

#
ssh -i ~/.ssh/id_rsa.hetzner root@<ip>

#
apt update && apt upgrade -y
```

<!--
grep PermitRootLogin /etc/ssh/sshd_config

sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config
systemctl restart ssh

grep PermitRootLogin /etc/ssh/sshd_config
-->

<!--
cat /var/lib/cloud/instance/user-data.txt
-->
