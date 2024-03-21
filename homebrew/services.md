# Homebrew Services

## CLI

### Commands

```sh
brew services -h
```

### Usage

```sh
#
brew services list
```

### Tips

#### Logs

```sh
#
ls /usr/local/var/log

#
tail -f /usr/local/var/log/<filename>.log
```

### Issues

#### Status Error

```sh
#
launchctl list | grep <service-name>
```
