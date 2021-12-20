# ulimit

## Guides

- [Understanding /etc/security/limits.conf File](https://www.thegeekdiary.com/understanding-etc-security-limits-conf-file-to-set-ulimit/)

## CLI

### Commands

```sh
man ulimit
```

### Usage

```sh
# Show soft limit
ulimit -Sn
ulimit -n 10000
ulimit -n unlimited

# Show hard limit
ulimit -Hn
ulimit -u 10000
ulimit -u unlimited
```

### Tips

#### Find Output File Limit

```sh
# Darwin
# TODO

# Linux
cat /proc/sys/fs/file-max
sysctl fs.file-max

cat /etc/security/limits.conf
```

#### Limit

```sh
# Darwin
launchctl limit maxfiles softcnt hardcnt
# Or
launchctl limit maxfiles 512 unlimited
# Or
launchctl limit maxfiles unlimited unlimited

# Linux
sudo sysctl -w fs.file-max=500000
sudo sysctl -p
```

### Issues

#### Cannot Modify Limits

```log
ulimit: open files: cannot modify limit: Operation not permitted
```

```sh
#
cat << EOF | sudo tee /etc/security/limits.d/20-nofile.conf
*  soft  nofile 10000
EOF

#
sudo su - "$USER"

#
ulimit -Sn
```

<!-- ```sh
#
cat << EOF | sudo tee /etc/security/limits.d/20-nofile.conf
*  hard  nofile 10000
EOF

#
sudo su - "$USER"

#
ulimit -Hn
``` -->

<!--
prlimit --pid 12345 --nofile=1024:2048

echo "fs.file-max=500000" > /etc/sysctl.d/local.conf

sudo sysctl -w fs.inotify.max_user_watches=100000
-->
