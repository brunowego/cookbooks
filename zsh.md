# Z shell (Zsh)

## Installation

### Homebrew

```sh
brew install zsh
```

### YUM

```sh
sudo yum check-update
sudo yum -y install zsh
```

### APT

```sh
sudo apt update
sudo apt -y install zsh
```

## Configuration

```sh
sudo chsh $USER -s /bin/zsh
# for OS X
sudo chpass -s `which zsh` $USER
```

```sh
sudo su - $USER
```

## Tips

### Reload

```sh
source ~/.zshrc
```

## Issues

### Authentication failure

> chsh: PAM: Authentication failure

```sh
sudo sed -rie '/^auth([ \t]+)required([ \t]+)pam_shells\.so/s/auth/# auth/g' /etc/pam.d/chsh
```
