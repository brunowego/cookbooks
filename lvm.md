# Logical Volume Manager

http://www.landoflinux.com/linux_lvm_command_examples.html

## References

## CLI

### Examples

#### Display Physical Volumes

```sh
sudo pvs
sudo pvdisplay
```

#### Display Volume Groups

```sh
sudo vgs
sudo vgdisplay rootvg
```

#### Display Logical Volume Information

```sh
sudo lvs
sudo lvdisplay /dev/rootvg/lv_root
```

#### List Partition types on a Linux system

```sh
lsblk
```

#### List Partitions on a Linux system

```sh
sudo fdisk -l /dev/sda
sudo fdisk -l | grep /dev/sd
```

#### Create a Physical Volume

```sh
sudo pvcreate /dev/sdc
```

#### Remove a Physical Volume

```sh
sudo pvremove /dev/sdc
```

#### Create a New Volume Group

```sh
sudo pvcreate /dev/sdc
sudo pvs
```

#### Rename a Volume Group

```sh
sudo vgs
sudo vgrename vg01 test_vg01
```

#### Remove a Volume Group

```sh
vgremove test_vg01
```

#### Extend a Volume Group

```sh
vgdisplay vg_rhel01
vgextend vg_rhel01 /dev/sdc
```

#### Remove a Physical Volume from a Volume Group

```sh
pvs
vgreduce vg_rhel01 /dev/sdc
```

#### Reduce

```sh
sudo dmsetup info -c | grep lv_tmp
sudo lsof | grep '253,6'

df -h /tmp

ls /dev/mapper

sudo lvchange -an -v /dev/mapper/rootvg-lv_tmp

sudo lsof /tmp
fuser -mv /dev/mapper/rootvg-lv_tmp
fuser -mv /tmp
fuser -k -TERM /tmp

sudo umount -l /dev/mapper/rootvg-lv_tmp

sudo e2fsck -fy /dev/mapper/rootvg-lv_tmp

sudo lvreduce -L 10G /dev/mapper/rootvg-lv_tmp
sudo lvreduce -L -10G /dev/mapper/rootvg-lv_tmp

sudo resize2fs /dev/mapper/rootvg-lv_tmp

sudo e2fsck -fy /dev/mapper/rootvg-lv_tmp

sudo mount /tmp

df -h /tmp
```

#### Extend

```sh
sudo lvextend -L +5g /dev/rootvg/lv_usr
```
