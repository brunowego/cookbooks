# Linux

## Installation

### Zypper

```sh
sudo zypper update -y
sudo zypper install -y docker-ce docker-ce-cli containerd.io
```

### YUM

```sh
sudo yum check-update
sudo yum -y install yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum -y install docker-ce docker-ce-cli containerd.io
```

> [More versions](https://download.docker.com/linux/centos/7/x86_64/stable/Packages) for CentOS.

### APT

#### Xenial Xerus 16.04 and newer

```sh
sudo apt update
sudo apt -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```

```sh
sudo apt update
sudo apt -y install docker-ce docker-ce-cli containerd.io
```

## Service

> Before start certify that your network need `bip` configured to prevent issues with subnet.

```sh
sudo systemctl enable --now docker
```

## Configuration

```sh
sudo usermod -aG docker $USER && sudo su - $USER
```

## Uninstall

### Zypper

```sh
sudo zypper rm docker
```

### YUM

```sh
sudo yum remove -y docker-ce docker-ce-cli containerd.io
```

#### Disable Repository

```sh
sudo yum-config-manager --disable docker-ce
```

#### Old

```sh
sudo yum remove -y docker \
  docker-client \
  docker-client-latest \
  docker-common \
  docker-latest \
  docker-latest-logrotate \
  docker-logrotate \
  docker-engine
```

### APT

```sh
sudo apt purge -y docker-ce
```

```sh
sudo apt autoremove
```

### Deep Clean

```sh
sudo rm -r /etc/docker
sudo rm -r /var/lib/docker
sudo rm -r /srv/docker
sudo rm -r /etc/sysconfig/docker
sudo rm -r /run/docker
```

### Group

```sh
sudo groupdel docker
```

## Logs

TODO
