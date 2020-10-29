# Hostname

## CLI

### Commands

```sh
hostname --help
```

### Tips

#### Show

```sh
sudo cat /etc/hostname
```

### Usage

```sh
# Get IP
hostname -I

# Set
sudo hostnamectl set-hostname [name] # ally, apex, axis, axel
hostnamectl status
sudo shutdown -r now
```

### Issues

#### Command not found

```log
sudo: hostnamectl: command not found
```

Use `scutil` for Darwin.
