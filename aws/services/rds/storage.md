# RDS Storage

## Tips

### Resize

```sh
#
lsblk

#
sudo growpart /dev/<device> 1

#
sudo xfs_growfs /

#
df -h /
```
