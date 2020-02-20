# Linuxbrew

## CLI

### Dependencies

#### APT

```sh
sudo apt update
sudo apt -y install curl git build-essential
```

#### YUM

```sh
yum check-update
sudo yum -y install curl git
sudo yum -y groupinstall 'Development Tools'
```

### Installation

```sh
/bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
```

### Configuration

```sh
# bash
echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> ~/.bash_profile

# zsh
echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> ~/.zprofile
```

```sh
sudo su - "$USER"
```

### Uninstall

```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/uninstall)"
```
