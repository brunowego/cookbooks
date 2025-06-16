# Docker Community Edition (CE) Daemon

## Dependencies

- Ubuntu
  - [Software Properties Common](/apt/software-properties-common.md#installation)
- Windows
  - [Windows Subsystem Linux (WSL)](/microsoft/windows/wsl.md)

## Installation

```sh
# Homebrew
brew install --cask docker

# Using APT
# Xenial Xerus 16.04 and newer
curl -fsSL 'https://download.docker.com/linux/ubuntu/gpg' | \
  sudo apt-key add - && sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt update
sudo apt -y install docker-ce

# Using YUM
yum check-update
sudo yum-config-manager --add-repo 'https://download.docker.com/linux/centos/docker-ce.repo'
sudo yum -y install docker-ce

# Using Zypper
sudo zypper refresh
sudo zypper install -y docker-ce

# Using Chocolatey
choco install -y docker-for-windows

# Using Winget
winget install --id=Docker.DockerDesktop -e
```

## Service

### Systemd

```sh
# Wait! Before continue be aware to configure bip
sudo systemctl enable --now docker
```

## Configuration

<!-- ~/.docker/daemon.json -->

### Linux

```sh
#
sudo groupadd docker

#
sudo usermod -aG docker "$USER" && \
  sudo su - "$USER"
```

## Tips

### Command-line completion

```sh
# Using Antigen
antigen bundle docker
```

### Deep Clean

```sh
sudo rm -r /etc/docker
sudo rm -r /var/lib/docker
sudo rm -r /srv/docker
sudo rm -r /etc/sysconfig/docker
sudo rm -r /run/docker
```

```sh
sudo groupdel docker
```

## Issues

### TBD

```log
Hyper-V feature not enabled
```

```powershell
#
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
```

### TBD

```log
running Hyper-V engine: starting Hyper-V VM: status code not OK but 500: Unhandled exception: job failed with message: 'DockerDesktopVM' failed to start. (Virtual machine ID
```

TODO

### TBD

```log
sudo: unable to resolve host ubuntu: Name or service not known
```

TODO

### Docker CLI Already Installed

```log
Error: It seems there is already a Binary at '/usr/local/share/zsh/site-functions/_docker'.
```

```sh
brew remove docker
```

## Uninstall

### APT

```sh
sudo apt purge -y docker-ce
sudo apt autoremove
```

### YUM

```sh
sudo yum remove -y docker-ce
```

### Zypper

```sh
sudo zypper rm docker
```
