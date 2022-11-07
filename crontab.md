# crontab

## Links

- [Crontab Generator](https://crontab-generator.org/)
- [Crontab.guru](https://crontab.guru/)

## CLI

### Installation

#### APT

```sh
sudo apt update
sudo apt -y install cron
```

#### YUM

```sh
yum check-update
sudo yum -y install cronie
```

### Commands

```sh
man crontab
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
export EDITOR=vim
```

### Usage

```sh
# List
crontab -l

# Edit
crontab -e

#
crontab -u <username>

# Directly Read
cat /etc/crontab # Linux
sudo cat /var/at/tabs/"$USER" # Darwin

# Load Specific
crontab /etc/cron.d/<filename> # Linux

# Remove
crontab -r
```
