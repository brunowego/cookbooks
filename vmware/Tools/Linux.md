# Linux

## Installation

### YUM

```sh
sudo yum check-update
sudo yum -y install open-vm-tools
```

### APT

#### Method 1

```sh
sudo apt update
sudo apt -y install open-vm-tools
```

#### Method 2

1. Virtual Machine
2. Install VMware Tools

```sh
tar -xzvf /media/$USER/VMware\ Tools/VMwareTools-*.tar.gz -C /tmp
( cd /tmp/vmware-tools-distrib && sudo ./vmware-install.pl -d ) && rm -rf /tmp/vmware-tools-distrib
```
