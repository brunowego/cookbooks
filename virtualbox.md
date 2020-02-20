# Oracle VM VirtualBox

## App

### Installation

#### Homebrew

```sh
brew cask install virtualbox virtualbox-extension-pack
```

#### YUM

```sh
yum check-update
sudo yum-config-manager --add-repo http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo
sudo yum -y install VirtualBox-6.0
```

#### Chocolatey

```sh
choco install -y virtualbox
```

### Configuration

#### Darwin

##### Allow Oracle

1. System Preferences
2. Security & Privacy
3. General
4. Allow

### Commands

```sh
VBoxManage
```

### Usage

```sh
# properties
VBoxManage list systemproperties

# vms
VBoxManage list vms
```

### Tips

#### Guest Additions

```sh
# Ubuntu
sudo apt -y install build-essential dkms "linux-headers-$(uname -r)"
```

1. Devices
2. Install Guest Additions CD image...
3. Run
4. Restart

```sh
# Check install
lsmod | grep vboxguest

# Get Version
sudo /usr/sbin/VBoxService --version
```

#### Resize

```sh
#
VBoxManage clonehd '[/path/to/source.vmdk]' '[/path/to/cloned.vdi]' --format vdi

#
VBoxManage modifyhd '[/path/to/cloned.vdi]' --resize 40000

#
VBoxManage clonehd '[/path/to/cloned.vdi]' '[/path/to/source.vmdk]' --format vmdk
```
