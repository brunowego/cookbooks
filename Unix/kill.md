# Kill

##

```sh
kill -9 [pid]
```

##

```sh
kill -9 "$(ps aux | grep [name] | grep -v grep | sed 's/^[^ ][^ ]*[ ][ ]*\([0-9][0-9]*\).*$/\1/g')"
```
