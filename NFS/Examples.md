# Examples

## Export

```sh
sudo mkdir -p [/path/to/export]
```

```sh
sudo chown nfsnobody: [/path/to/export]
```

```sh
sudo sh -c 'echo -e "\"[/path/to/export]\" *(rw,sync,no_root_squash,insecure)" >> /etc/exports.d/[name].exports'
```

```sh
sudo exportfs -a
```

```sh
sudo systemctl restart nfs
```

```sh
showmount -e 127.0.0.1
```

## Mount

```sh
mkdir -p [/path/to/mount/point]
```

```sh
mount -t nfs -o vers=3 [hostname]:[/path/to/export] [/path/to/mount/point]
```

## Un-mount

```sh
umount -t nfs [/path/to/mount/point]
```

##

```sh
mount | grep nfs
```
