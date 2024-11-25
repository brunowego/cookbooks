# htop

## CLI

### Installation

```sh
# Using Homebrew
brew install htop

# Using APT
sudo apt update
sudo apt -y install htop

# Using YUM
yum check-update

# Repo: EPEL
sudo yum -y install htop

# Using APK
sudo apk update
sudo apk add htop
```

### Commands

```sh
htop -h
```

### Usage

```sh
#
htop

#
htop -p $(pgrep pg_dump)
```
