# Hetzner

**Keywords:** Cloud Provider

<!--
https://www.youtube.com/watch?v=q241nOF246o
-->

## Links

- [Main Website](https://hetzner.com)
- [Console](https://console.hetzner.cloud)

## Configuration

```sh
#
ssh-add ~/.ssh/id_rsa.hetzner

#
ssh -i ~/.ssh/id_rsa.hetzner root@<ip>

#
apt update && apt upgrade -y

#
adduser brunowego
usermod -aG sudo brunowego
groups brunowego

#
mkdir -p /home/brunowego/.ssh
chmod 700 /home/brunowego/.ssh
cat ~/.ssh/authorized_keys >> /home/brunowego/.ssh/authorized_keys
chmod 600 /home/brunowego/.ssh/authorized_keys
chown -R brunowego:brunowego /home/brunowego/.ssh
ssh brunowego@<ip>

#
sudo chown -R brunowego:brunowego /home/brunowego

#
su - brunowego
sudo whoami

#
echo 'brunowego ALL=(ALL) NOPASSWD:ALL' | sudo tee /etc/sudoers.d/brunowego
sudo chmod 440 /etc/sudoers.d/brunowego

#
vim ~/.ssh/config

Host hetzner
    HostName <ip>
    User brunowego
    IdentityFile ~/.ssh/id_rsa.hetzner
```

<!--
vim /etc/ssh/sshd_config
PermitRootLogin
systemctl restart sshd
-->
