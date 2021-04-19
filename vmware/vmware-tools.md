# VMware Tools

## CLI

### Installation

#### VMware

1. Virtual Machine
2. Install VMware Tools

#### Linux

```sh
tar -xzvf /media/$USER/VMware\ Tools/VMwareTools-*.tar.gz -C /tmp
( cd /tmp/vmware-tools-distrib && sudo ./vmware-install.pl -d ) && rm -fR /tmp/vmware-tools-distrib
```

#### YUM

```sh
yum check-update
sudo yum -y install open-vm-tools
```

#### APT

```sh
sudo apt update
sudo apt -y install open-vm-tools
```
