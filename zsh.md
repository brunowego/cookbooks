# Z shell (Zsh)

## References

- [Startup Files](http://zsh.sourceforge.net/Intro/intro_3.html)

## CLI

### Installation

#### Homebrew

```sh
brew install zsh
```

#### YUM

```sh
yum check-update
sudo yum -y install zsh
```

#### APT

```sh
sudo apt update
sudo apt -y install zsh
```

#### Zypper

```sh
sudo zypper refresh
sudo zypper install -y zsh
```

### Configuration

```sh
# for Linux
sudo chsh "$USER" -s /bin/zsh

# for Darwin
sudo chpass -s `which zsh` "$USER"
```

```sh
sudo su - "$USER"
```

```sh
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
chsh: user '[username]' does not exist in /etc/passwd
```

```sh
# Thought CLI
ssh [host] -t 'zsh --login'

# Thought SSH Config
cat << EOF >> ~/.ssh/config
Host [host]
  RemoteCommand zsh -l
  RequestTTY force
EOF
```
