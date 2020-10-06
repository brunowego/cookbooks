# ZYpp

- [Cheat sheet](https://en.opensuse.org/SDB:Zypper_usage)
- [Package repositories](https://en.opensuse.org/Package_repositories)

## Commands

```sh
zypper help
```

## Usage

```sh
#
zypper refresh

#
zypper rm -uy [package]
```

## Tips

### Repository

```sh
ls /etc/zypp/repos.d
```

## Issues

### PID lock

```log
System management is locked by the application with pid 000000 (zypper).
```

```sh
sudo kill -KILL [PID]
```

### Zypper lock

```sh
cat /etc/zypp/locks
```

```sh
zypper rl [package]
```
