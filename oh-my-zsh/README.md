# Oh My Zsh

## Bare-metal

### Dependencies

#### Homebrew

```sh
brew install zsh curl git gnu-sed
```

#### YUM

```sh
yum check-update
sudo yum -y install zsh curl git
```

#### APT

```sh
sudo apt update
sudo apt -y install zsh curl git
```

### Installation

```sh
curl -L http://install.ohmyz.sh | /bin/zsh
```

```sh
# for Darwin
sudo chpass -s $(which zsh) "$USER"

# for Linux
sudo chsh "$USER" -s /bin/zsh
```

```sh
sudo su - "$USER"
```

### Issues

<!-- #### LDAP Users

```log
Changing shell for ?.
chsh: user "?" does not exist.
```

```sh
# Check if exists
grep "$USER" /etc/passwd
```

```sh
cat << \EOF >> ~/.bash_profile

if ($?prompt) then
  exec /usr/bin/zsh -l
  export SHELL=/usr/bin/zsh
endif
EOF
```

```sh
sudo su - "$USER"
``` -->

## Tips

### Git Legend

- Prefix: `☁`
- Dirty: `☂`
- Untracked: `✭`
- Clean: `☀`
- Added: `✚`
- Modified: `⚡`
- Deleted: `✖`
- Renamed: `➜`
- Unmerged: `♒`
- Ahead: `𝝙`
