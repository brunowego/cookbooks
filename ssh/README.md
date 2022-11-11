# Secure Shell (SSH)

## Links

- [SSL vs TLS vs SSH](https://roadmap.sh/guides/ssl-tls-https-ssh)

## References

- [OpenSSH Client](/openssh-client.md)
- [OpenSSH Server](/openssh-server.md)

## CLI

### Usage

```sh
#
ssh \
  -o StrictHostKeyChecking=no \
  -l \
  -i <privatekey>.pem \
  <username>@<IP> \
  -v
```

### Tips

#### Visual Studio Code

```sh
code --install-extension mousavian.ssh-config-syntax-highlighter
```

#### Costumers Key

```sh
#
export COSTUMER_NAME=''
export COSTUMER_ID_RSA_FILE="$HOME/.ssh/costumers/$COSTUMER_NAME/id_rsa"

#
mkdir -p ~/.ssh/costumers/"${COSTUMER_NAME}"

#
cat << EOF > "$COSTUMER_ID_RSA_FILE"
-----BEGIN OPENSSH PRIVATE KEY-----

-----END OPENSSH PRIVATE KEY-----
EOF

#
chmod 0400 "$COSTUMER_ID_RSA_FILE"  # 0644

#
ssh \
  -i "$COSTUMER_ID_RSA_FILE" \
  <username>@<ip>
```

#### Remove Host Key

```sh
#
ssh-keygen -R <hostname>

#
sed -i '6d' ~/.ssh/known_hosts
```

#### Visual Studio Code

```sh
code --install-extension chrmarti.ssh
```

#### Hide Banner

```sh
# Thought SSHD Config
sudo sed -i 's/#\(Banner\)/\1/g' /etc/ssh/sshd_config

# Thought SSH Config
cat << EOF >> ~/.ssh/config
Host <host>
  LogLevel QUIET
EOF
```

#### Change Folder

```sh
cat << EOF >> ~/.ssh/config
Host <hostname>
  User <username>
  LogLevel QUIET
  ProxyJump <hostname>
  RemoteCommand cd ~/path/to/project; bash -l
  # RemoteCommand cd ~/path/to/project; zsh -l
  RequestTTY force
EOF
```

#### Proxy

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
ssh <username>@<IP>

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

#### HTTP SSH Tunnel

<!--
https://github.com/mainyaa/RaspberryPi-Mothership/blob/c9b2b676f650a83a741ddc757d9dd69b795ab672/README.md
https://www.ssh.com/ssh/tunneling/example
https://stackabuse.com/how-to-tunnel-http-with-ssh/
-->

```sh
ssh \
  -D <port> \
  <username>@<hostname>
```

#### ProxyJump

```sh
ssh -J <remote> <another-remote>
```

```sh
Host *
  ProxyJump <remote>
```

#### Enable Darwin

```sh
# Darwin
sudo lsof -i:22
```

1. System Preferences
2. Sharing
3. \<On> Remote Login

#### Root Only With Key

```sh
sed -i 's/PermitRootLogin yes/PermitRootLogin without-password/' /etc/ssh/sshd_config
```

```sh
# for Linux
sudo service sshd restart
```

#### Direct Access

```sh
cat ~/.ssh/id_rsa.pub | ssh <username>@<IP> 'cat >> ~/.ssh/authorized_keys'
```

<!-- ###

```sh
sudo sed -i '/^Port 22.*/a Port 8000' /etc/ssh/sshd_config

sudo systemctl restart sshd
``` -->

### Issues

#### Remote Connection Close

```log
Connection to <hostname> closed by remote host.
```

##### Locally for a Specific Host

```ini
Host <hostname>
  # ...
  TCPKeepAlive yes
  ServerAliveInterval 30
  ServerAliveCountMax 1
```

#### Using CLI

```sh
ssh \
  -o ServerAliveInterval=30 \
  -o ServerAliveCountMax=1 \
  <host>
```

##### On the Server

```sh
sudo sed -i 's/#\(TCPKeepAlive\)/\1/g' /etc/ssh/sshd_config
sudo sed -i 's/#\(ClientAliveInterval\)/\1/g' /etc/ssh/sshd_config
sudo sed -i 's/#\(ClientAliveCountMax\)/\1/g' /etc/ssh/sshd_config
```

#### Bad owner or permissions

```log
Bad owner or permissions on /home/<username>/.ssh/config
```

```sh
#
chown "$USER" ~/.ssh/config

#
chmod 600 ~/.ssh/config
```
