# fstab

## CLI

### Tips

#### Default Mount Path

```sh
#
ls /Volumes

#
diskutil info /Volumes/[name] | grep UUID

#
mkdir -p [/path/to/folder]

#
echo "UUID=[UUID] [/absolute/path/to/folder] apfs rw" | sudo tee -a /etc/fstab
```

<!-- ### NFS

```sh
sudo echo '192.168.0.9:/mnt/ApolloNAS/media /mnt/apollo-media nfs defaults' | sudo tee -a /etc/fstab
``` -->
