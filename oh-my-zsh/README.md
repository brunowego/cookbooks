# Oh My Zsh

## Bare-metal

### Dependencies

- [Z shell (Zsh)](/zsh.md)
- [cURL](/curl.md)
- [Git](/git.md)
- [GNU Sed](/gnu_sed.md)

### Extend

- [Themes](/oh-my-zsh/themes.md)
- [Plugins](/oh-my-zsh/plugins.md)
- [Custom](/oh-my-zsh/custom.md)

### Installation

#### Unix-like

```sh
# cURL
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# GNU Wget
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
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

### Usage

```sh
# Upgrade
update_ohmyzsh
```

<!-- ### Issues -->

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
