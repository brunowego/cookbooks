# Kernel-based Virtual Machine (KVM)

## CLI

### Dependencies

- [CPU-Checker](/cpu-checker.md)

### Installation

#### Homebrew

#### APT

```sh
sudo apt update
sudo apt -y install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils
```

### Tips

#### Check Support

```sh
# Darwin
kextstat | grep intel

# Linux
egrep -c '(vmx|svm)' /proc/cpuinfo
```
