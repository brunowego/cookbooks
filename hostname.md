# Hostname

<!--
Ally
Axel
Apex
Atom
-->

## CLI

### Commands

```sh
# Unix-like
hostname --help

# Windows
hostname /?
```

### Usage

#### Darwin

```sh
# Show
scutil --get ComputerName
scutil --get HostName
scutil --get LocalHostName

# Set
sudo scutil --set ComputerName "John's MacBook Pro"
sudo scutil --set HostName 'john.macbook.pro'
sudo scutil --set LocalHostName 'John-MacBook-Pro'

#
sudo su - "$USER"
```

#### Linux

```sh
# Show
sudo cat /etc/hostname

# Get IP
hostname -I

# Set
sudo hostnamectl set-hostname <name>
hostnamectl status
sudo su - "$USER"
```

#### Windows

```sh
# Show
hostname

# Or, using environment variable
echo %computername%
```

### Issues

#### Command not found

```log
sudo: hostnamectl: command not found
```

Use `scutil` for Darwin.
