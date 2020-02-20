# Network File System (NFS)

## CLI

### Installation

#### YUM

```sh
yum check-update
sudo yum -y install nfs-utils
```

#### APT

```sh
sudo apt update
sudo apt -y install nfs-utils
```

### Service

#### Server

##### Darwin

```sh
sudo nfsd start
```

##### Linux

```sh
sudo systemctl enable --now nfs-server
```

#### Client

##### Darwin

1. Finder
2. Go
3. Connect to Server...
4. `nfs://[hostname]:[/path/to/mount]`

##### Linux

```sh
sudo systemctl enable --now nfs
```

### Examples

#### Export

```sh
# Specific folder
mkdir -p "$HOME/Example"
# chown nfsnobody: "$HOME/Example"
sudo tee -a /etc/exports <<< "$HOME/Example *(rw,sync,no_root_squash,insecure)"

# Current user
mkdir -p "$HOME/Example"
sudo tee -a /etc/exports <<< "$HOME/Example -alldirs -mapall=$(id -u):$(id -g) localhost"
```

```sh
# Darwin
sudo nfsd restart

# Linux
sudo systemctl restart nfs
```

```sh
showmount -e localhost
```

#### Mount

```sh
mkdir -p [/path/to/mount/point]
```

```sh
mount \
  -t nfs \
  -o vers=3 \
  [hostname]:[/path/to/export] \
  [/path/to/mount/point]
```

#### Un-mount

```sh
mount | grep -i nfs
```

```sh
showmount -e localhost
```

```sh
umount \
  -t nfs \
  [/path/to/mount/point]
```

### Issues

#### Permissions

```log
No such file or directory
```

```sh
cat /etc/exports
```

Not have a mounted path.

#### Program not registered

```log
RPC: Program not registered
```

```sh
# Darwin
launchctl stop com.apple.rpcbind
launchctl start com.apple.rpcbind

# Linux
sudo systemctl restart rpcbind
```

#### Program not available

```log
RPC prog. not avail
```

```sh
# Darwin
sudo nfsd status

# Linux
sudo systemctl status nfs
```
