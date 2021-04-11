# SSHFS

<!--
https://susanqq.github.io/jekyll/pixyll/2017/09/05/remotefiles/
https://sftptogo.com/blog/how-to-mount-sftp-as-a-drive-on-mac/
-->

## CLI

### Dependencies

#### Homebrew

```sh
brew install --cask osxfuse
```

### Installation

#### Homebrew

```sh
brew install sshfs
```

#### YUM

```sh
yum check-update
sudo yum -y install sshfs
```

### Commands

```sh
sshfs -h
```

### Usage

```sh
# Mount
sshfs [username]@[hostname]:[/path/to/folder] [/path/to/mount/point]

# Unmount
# fusermount -u [/path/to/mount/point]
# pkill -kill -f 'sshfs' && diskutil unmount [/path/to/mount/point]
```

### Tips

#### SSH Tunneling

```sh
#
ssh \
  -N \
  -L 2222:[hostname]:22 \
  [hostname]

#
sshfs \
  -p 2222 \
  [username]@127.0.0.1:[/path/to/folder] \
  [/path/to/mount/point] \
  -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3
```
