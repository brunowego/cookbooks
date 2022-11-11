# Secure Copy Protocol (SCP)

## Alternative

- [Remote Sync (rsync)](/rsync.md)

## CLI

### Commands

```sh
man scp
```

### Usage

```sh
#
scp -v <username>@<hostname>:</absolute/path/to/filename> <filename>

#
scp -r </path/to/folder> <username>@<hostname>:</absolute/path/to/folder>
```

<!--
#
scp -o ProxyJump=<username>@<hostname> <filename> <username>@<hostname>:</absolute/path/to/filename>

# Output TTY
echo 'hello' > /dev/tty

echo "$(scp <username>@<hostname>:</absolute/path/to/file> /dev/tty &> /dev/null)"
-->

<!--
https://www.urbaninsight.com/article/running-scp-through-ssh-tunnel
-->
