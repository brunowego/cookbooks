# Issues

## PID lock

> System management is locked by the application with pid 000000 (zypper).

```sh
sudo kill -KILL [PID]
```

## Zypper lock

```sh
cat /etc/zypp/locks
```

```sh
zypper rl [package]
```
