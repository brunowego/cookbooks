# Problems

## System time

> make: Warning: File `[filename]' has modification time XXX s in the future
> make: warning:  Clock skew detected.  Your build may be incomplete.

```sh
VBoxManage list vms
```

```sh
VBoxManage guestproperty set [uuid|vmname] '/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold' 60000
```

## Please use a provider that exists

> The provider 'VIRTUALBOX' could not be found, but was requested to back the machine 'default'. Please use a provider that exists.

```sh
mv .vagrant/machines/$DOCKER_MACHINE_NAME/VIRTUALBOX .vagrant/machines/$DOCKER_MACHINE_NAME/virtualbox
```

```sh
echo 'export VAGRANT_DEFAULT_PROVIDER=virtualbox' >> ~/.bashrc
source ~/.bashrc
```

## Force exit

> An action '[name]' was attempted on the machine 'default', but another process is already executing an action on the machine. Vagrant locks each machine for access by only one process at a time. Please wait until the other Vagrant process finishes modifying this machine, then try again.
> If you believe this message is in error, please check the process listing for any "ruby" or "vagrant" processes and kill them. Then try again.

```sh
ps aux | grep 'vagrant'
kill -9 [PID]
```
