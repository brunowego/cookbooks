# Hostname

## CLI

### Commands

```sh
# Unix-like
hostname --help

# Windows
hostname /?
```

### Usage

#### Unix-like

```sh
# Show
sudo cat /etc/hostname

# Get IP
hostname -I

# Set
sudo hostnamectl set-hostname [name]
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
