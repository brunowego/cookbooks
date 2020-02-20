# Sudoers

## Darwin

```sh
sudo tee /etc/sudoers.d/vagrant-syncedfolders << EOF
Cmnd_Alias      VAGRANT_EXPORTS_ADD = /usr/bin/tee -a /etc/exports
Cmnd_Alias      VAGRANT_NFSD = /sbin/nfsd restart
Cmnd_Alias      VAGRANT_EXPORTS_REMOVE = /usr/bin/sed -Ee /*/ d -ibak /etc/exports

%admin          ALL = (root) NOPASSWD: VAGRANT_EXPORTS_ADD, VAGRANT_NFSD, VAGRANT_EXPORTS_REMOVE
EOF
```

```sh
sudo su - "$USER"
```
