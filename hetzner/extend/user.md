# Extend with User

## Configuration

**Create User:**

```sh
#
export USERNAME=''

#
adduser "$USERNAME" --disabled-password

#
usermod -aG sudo "$USERNAME"

#
groups "$USERNAME"
```

**SSH Key:**

```sh
#
export USERNAME=''

#
mkdir -p /home/"$USERNAME"/.ssh
chmod 700 /home/"$USERNAME"/.ssh

#
cat ~/.ssh/authorized_keys > "/home/$USERNAME/.ssh/authorized_keys"
chmod 600 "/home/$USERNAME/.ssh/authorized_keys"

#
chown -R "$USERNAME:$USERNAME" "/home/$USERNAME"

#
echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" | sudo tee "/etc/sudoers.d/$USERNAME"
chmod 440 "/etc/sudoers.d/$USERNAME"

#
# vim /etc/ssh/sshd_config
# PermitRootLogin
# systemctl restart ssh

#
exit
```

**Testing:**

```sh
#
export USERNAME=''

#
ssh "$USERNAME"@<ip>

#
# su - "$USERNAME"
sudo su
sudo whoami
```

**SSH Config:**

```sh
#
cat << EOF > ~/.ssh/config
Host coolify
    HostName <ip>
    User "$USERNAME"
    IdentityFile ~/.ssh/id_rsa.coolify
EOF

#
ssh "$USERNAME"
```
