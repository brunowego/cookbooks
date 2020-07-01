# Vagrant

## CLI

### Installation

#### Homebrew

```sh
brew cask install vagrant vagrant-manager
```

#### YUM

```sh
yum check-update
sudo yum -y install https://releases.hashicorp.com/vagrant/2.2.3/vagrant_2.2.3_x86_64.rpm
```

#### Chocolatey

```sh
choco install -y vagrant
```

### Commands

```sh
vagrant -h
```

### Examples

#### Snapshot

```sh
# Save
vagrant snapshot save default [name]

# Restore
vagrant snapshot restore [name]
```

### Tips

#### Visual Studio Code

```sh
code --install-extension marcostazi.VS-code-vagrantfile
```

#### Command-line completion

```sh
# Using Oh My Zsh
sed -ri 's/^plugins=\((.*)\)/plugins=\(\1 vagrant\)/g' ~/.zshrc

source ~/.zshrc

rm ~/.zcompdump*
```

#### Execute command

```sh
vagrant ssh -c '[path/to/exec]'
```

#### Show IP

```sh
vagrant ssh -c 'hostname -I | cut -d " " -f 2' 2> /dev/null
```

#### Debug

```sh
# using environment
VAGRANT_LOG=DEBUG vagrant [command]

# using cli
vagrant [command] --debug
```

### Issues

#### System time

```log
make: Warning: File `[filename]' has modification time XXX s in the future
make: warning:  Clock skew detected.  Your build may be incomplete.
```

```sh
VBoxManage list vms
```

```sh
VBoxManage guestproperty set [uuid|vmname] '/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold' 60000
```

#### Please use a provider that exists

```log
The provider 'VIRTUALBOX' could not be found, but was requested to back the machine 'default'. Please use a provider that exists.
```

```sh
mv .vagrant/machines/$DOCKER_MACHINE_NAME/VIRTUALBOX .vagrant/machines/$DOCKER_MACHINE_NAME/virtualbox
```

```sh
echo 'export VAGRANT_DEFAULT_PROVIDER=virtualbox' >> ~/.bashrc
```

```sh
source ~/.bashrc
```

#### Force exit

```log
An action '[name]' was attempted on the machine 'default', but another process is already executing an action on the machine. Vagrant locks each machine for access by only one process at a time. Please wait until the other Vagrant process finishes modifying this machine, then try again.
If you believe this message is in error, please check the process listing for any "ruby" or "vagrant" processes and kill them. Then try again.
```

```sh
sudo pidof -k vagrant
```

####

```log
The following SSH command responded with a non-zero exit status.
Vagrant assumes that this means the command failed!

mount -o vers=3,udp 10.1.1.1:/System/Volumes/Data/Users/path/to/project /vagrant

Stdout from the command:

Stderr from the command:

mount.nfs: access denied by server while mounting 10.1.1.1:/System/Volumes/Data/Users/path/to/project
```

TODO

### Uninstall

#### Homebrew

```sh
brew cask uninstall vagrant vagrant-manager
```

```sh
rm -r ~/.vagrant.d
```
