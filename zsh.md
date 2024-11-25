# Z shell (Zsh)

## References

- [Startup Files](http://zsh.sourceforge.net/Intro/intro_3.html)

## CLI

### Installation

```sh
# Using Homebrew
brew install zsh

# Using APT
sudo apt update
sudo apt -y install zsh

# Using YUM
yum check-update
sudo yum -y install zsh

# Using Zypper
sudo zypper refresh
sudo zypper install -y zsh
```

### Configuration

```sh
# for Linux
sudo chsh "$USER" -s /bin/zsh

# for Darwin
sudo chpass -s `which zsh` "$USER"

#
sudo su - "$USER"

#
echo "$SHELL"
```

### Usage

```sh
# Version
zsh --version | head -1
```

### Tips

#### Reload

```sh
source ~/.zshrc
```

### Issues

#### LDAP Authentication

```log
chsh: user '<username>' does not exist in /etc/passwd
```

```sh
# Thought CLI
ssh <host> -t 'zsh --login'

# Thought SSH Config
cat << EOF >> ~/.ssh/config
Host <host>
  RemoteCommand zsh -l
  RequestTTY force
EOF
```
