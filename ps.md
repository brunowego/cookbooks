# ps

## CLI

### Commands

```sh
man ps
```

### Usage

```sh
#
ps aux | grep [text]

#
ps -eo pid,etime,comm

#
ps -o pid,rss,command -p $(pgrep -f [text])

#
kill -9 [pid]
```
