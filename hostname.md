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
sudo hostnamectl set-hostname [name]
```

| OS | Name |
| --- | --- |
| Darwin | `ally` |
| CentOS | `axis` |
| Ubuntu | `apex` |
| Darwin (Mobile) | `axel` |

```sh
#
hostnamectl status

#
sudo su - "$USER"
```

### Issues

#### Command not found

```log
sudo: hostnamectl: command not found
```

Use `scutil` for Darwin.
