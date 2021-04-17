# Vagrant Libvirt Provider

## References

- [Vagrant Libvirt Provider - PCI device passthrough](https://github.com/vagrant-libvirt/vagrant-libvirt#pci-device-passthrough)

## Dependencies

- [libvirt](/libvirt.md)
- [QEMU](/qemu.md)

## Installation

```sh
# Linux
CONFIGURE_ARGS='with-libvirt-include=/usr/include/libvirt with-libvirt-lib=/usr/lib' \
  vagrant plugin install vagrant-libvirt

# Darwin
CONFIGURE_ARGS='with-libvirt-include=/usr/local/include/libvirt with-libvirt-lib=/usr/lib' \
  vagrant plugin install vagrant-libvirt
```

##

```sh
brew services start libvirt

sed -i 's/#\(unix_sock_group\)/\1/g' /usr/local/etc/libvirt/libvirtd.conf
sed -i '/^unix_sock_group/ s/libvirt/admin/g' /usr/local/etc/libvirt/libvirtd.conf
sed -i 's/#\(unix_sock_dir\)/\1/g' /usr/local/etc/libvirt/libvirtd.conf

brew services restart libvirt

virsh -c 'qemu:///system?socket=/usr/local/var/run/libvirt/libvirt-sock' net-list --all
virsh -c "qemu+ssh://$(hostname)/system?socket=/usr/local/var/run/libvirt/libvirt-sock"
```

## Usage

```sh
vagrant up --provider=libvirt

# or
export VAGRANT_DEFAULT_PROVIDER=libvirt
```
