# Secure Shell (SSH)

## Usage

```sh
#
ssh -i [privatekey].pem [username]@[IP]
```

## Tips

### Hide Banner

```sh
# Thought SSHD Config
sudo sed -i 's/#\(Banner\)/\1/g' /etc/ssh/sshd_config

# Thought SSH Config
cat << EOF >> ~/.ssh/config
Host [host]
  LogLevel QUIET
EOF
```

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

### HTTP SSH Tunnel

<!--
https://github.com/mainyaa/RaspberryPi-Mothership/blob/c9b2b676f650a83a741ddc757d9dd69b795ab672/README.md
https://www.ssh.com/ssh/tunneling/example
https://stackabuse.com/how-to-tunnel-http-with-ssh/
-->

```sh
ssh -D [port] [username]@[hostname]
```

### ProxyJump

```sh
ssh -J [remote] [another-remote]
```

```sh
Host *
  ProxyJump [remote]
```

### Enable Darwin

```sh
# Darwin
sudo lsof -i:22
```

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

<!-- ###

```sh
sudo sed -i '/^Port 22.*/a Port 8000' /etc/ssh/sshd_config

sudo systemctl restart sshd
``` -->

## Issues

### Bad owner or permissions

```log
Bad owner or permissions on /home/[username]/.ssh/config
```

```sh
#
chown "$USER" ~/.ssh/config

#
chmod 600 ~/.ssh/config
```
