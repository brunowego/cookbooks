# Substitute User (su)

## Commands

```sh
su -h
```

##

```sh
ls -tla /var/log

last -f /var/log/btmp
tail -f /var/log/messages

strace -tvfs 2048 -o su_strace_root.log su -lc exit
cat su_strace_root.log
```
