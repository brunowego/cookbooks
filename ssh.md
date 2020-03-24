# Secure Shell (SSH)

## Examples

###

```sh
ssh -i [privatekey].pem [username]@[IP]
```

## Tips

### Proxy

```sh
# Local
tee ~/.ssh/config << EOF
Host *
  SetEnv \
    http_proxy="$http_proxy" \
    https_proxy="$https_proxy" \
    no_proxy="$no_proxy" \
    DOCKER_BUILD_OPTS="$DOCKER_BUILD_OPTS" \
    DOCKER_RUN_OPTS="$DOCKER_RUN_OPTS"

EOF

# Remove
ssh [username]@[IP]

sudo sed -ri 's/AcceptEnv (.*)/AcceptEnv \1 *_proxy *_OPTS/g' /etc/ssh/sshd_config

# cat << EOF | sudo tee -a /mnt/sda1/var/lib/boot2docker/ssh/sshd_config
# AcceptEnv LANG LC_* XMODIFIERS *_proxy *_OPTS
# EOF

# for Linux
sudo service sshd restart
```

```sh
# run exit command and access again remote host.
env | grep -i _proxy= | sort
```

## Tips

### Enable Darwin

1. System Preferences
2. Sharing
3. \[On] Remote Login

### Root Only With Key

```sh
sed -i 's/PermitRootLogin yes/PermitRootLogin without-password/' /etc/ssh/sshd_config
```

```sh
# for Linux
sudo service sshd restart
```

### Direct Access

```sh
cat ~/.ssh/id_rsa.pub | ssh [username]@[IP] 'cat >> ~/.ssh/authorized_keys'
```
