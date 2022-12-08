# firewalld

## CLI

### Installation

#### YUM

```sh
yum check-update
sudo yum -y install firewalld
```

### Usage

```sh
sudo firewall-cmd --list-all

sudo firewall-cmd --zone=public --add-port=80/tcp --permanent

sudo firewall-cmd --reload

sudo systemctl disable --now firewalld
```
