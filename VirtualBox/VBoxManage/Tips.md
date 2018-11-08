# Tips

## Resize

```sh
VBoxManage clonehd '[/path/to/source.vmdk]' '[/path/to/cloned.vdi]' --format vdi
```

```sh
VBoxManage modifyhd '[/path/to/cloned.vdi]' --resize 40000
```

```sh
VBoxManage clonehd '[/path/to/cloned.vdi]' '[/path/to/source.vmdk]' --format vmdk
```
