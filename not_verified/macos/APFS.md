# Apple File System (APFS)

## List

```sh
diskutil list
```

## Mount

```sh
mkdir -p [/path/to/mount]
```

```sh
sudo mount -t apfs /dev/disk[id] [/path/to/mount]
```

## Un-mount

```sh
sudo umount -t apfs /dev/disk[id]

diskutil unmount /dev/disk[id]
```
