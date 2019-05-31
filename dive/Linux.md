# Linux

## Installation

### APT

```sh
sudo apt update
curl -OL https://github.com/wagoodman/dive/releases/download/v0.6.0/dive_0.6.0_linux_amd64.deb
sudo apt -y install ./dive_0.6.0_linux_amd64.deb
rm dive_0.6.0_linux_amd64.deb
```

### RPM

```sh
sudo yum check-update
curl -OL https://github.com/wagoodman/dive/releases/download/v0.6.0/dive_0.6.0_linux_amd64.rpm
sudo rpm -i dive_0.6.0_linux_amd64.rpm
rm dive_0.6.0_linux_amd64.rpm
```
