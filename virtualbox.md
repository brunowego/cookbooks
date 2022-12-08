# Oracle VM VirtualBox

<!--
Left `⌘` Command
-->

## Links

- [Main Website](https://virtualbox.org/)

## App

### Installation

#### Homebrew

```sh
brew install --cask virtualbox virtualbox-extension-pack
```

#### YUM

```sh
sudo yum-config-manager --add-repo 'http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo'

yum check-update
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

<!--
VBoxManage import /path/to/file.ova
-->

### Tips

#### Guest Additions

**Dependencies:**

```sh
# Ubuntu
sudo apt -y install build-essential dkms "linux-headers-$(uname -r)"
```

**Installation:**

1. Devices
2. Install Guest Additions CD image...
3. Run
4. Restart

<!--
sudo cp -f /media/cdrom0/VBoxLinuxAdditions.run /tmp
sudo /tmp/VBoxLinuxAdditions.run --nox11
sudo reboot
-->

```sh
# Check install
lsmod | grep vboxguest

# Get Version
sudo /usr/sbin/VBoxService --version
```

#### Resize

```sh
#
VBoxManage clonehd '</path/to/source.vmdk>' '</path/to/cloned.vdi>' --format vdi

#
VBoxManage modifyhd '</path/to/cloned.vdi>' --resize 40000

#
VBoxManage clonehd '</path/to/cloned.vdi>' '</path/to/source.vmdk>' --format vmdk
```
