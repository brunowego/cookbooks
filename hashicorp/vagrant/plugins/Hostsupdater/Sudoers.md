# Sudoers

## Darwin

```sh
sudo tee /etc/sudoers.d/vagrant-hosts << EOF
Cmnd_Alias      VAGRANT_HOSTS_ADD = /bin/sh -c echo "*" >> /etc/hosts
Cmnd_Alias      VAGRANT_HOSTS_REMOVE = /usr/bin/sed -ie /*/ d /etc/hosts

%admin          ALL = (root) NOPASSWD: VAGRANT_HOSTS_ADD, VAGRANT_HOSTS_REMOVE
EOF
```
