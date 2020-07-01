# Super User DO (sudo)

<!--
sudoers
-->

## CLI

### Commands

```sh
sudo -h
```

#### Login

```sh
sudo -i
sudo -iu [user]

# alternative
sudo su -
sudo su - [user]
```

#### Command

```sh
# running command as sudo
sudo [command]

# running shell as sudo
sudo -s
# or
sudo $(which bash)
```

### Tips

#### Environment

```sh
http_proxy=http://127.0.0.1:3128 sudo -E bash -c 'echo $http_proxy'
```

#### Proxy

```sh
# Linux/Darwin
sudo tee /etc/sudoers.d/proxy << EOF
Defaults env_keep += "HTTP_PROXY HTTPS_PROXY FTP_PROXY NO_PROXY"
Defaults env_keep += "http_proxy https_proxy ftp_proxy no_proxy"
EOF

# Test
sudo env | grep -i _proxy= | sort
```

<!-- ####

```sh
sudo -E bash -c 'echo $HTTP_PROXY'
``` -->

#### Edit Sudoers File

```sh
sudo visudo
```

> Alternative is `sudo vim /etc/sudoers`

#### Allow Specific

```sh
sudo USERNAME='john' /usr/bin/sh -c 'echo -e "$USERNAME\tALL=(ALL)\tNOPASSWD: ALL" > /etc/sudoers.d/$USERNAME'
```
