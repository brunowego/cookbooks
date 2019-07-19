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
# for Linux
sudo chsh $USER -s /bin/zsh

# for macOS
sudo chpass -s `which zsh` $USER
```

```sh
sudo su - $USER
```

```sh
echo $SHELL
```

## Tips

### Reload

```sh
source ~/.zshrc
```
