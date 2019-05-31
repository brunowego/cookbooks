# Port

## Test

### Host

```sh
ncat -lp [port]
```

### Guest

```sh
telnet [host] [port]
```

## Info

```sh
nc -v [host] [port]
```

## View

```sh
netstat -pan | grep [port]
```

## Port Forward

```sh
sudo ncat --sh-exec 'ncat [IP] [port]' -l [port] --keep-open
```

### Closing

```sh
ps aux | grep ncat
```

```sh
kill -9 [PID]
```
