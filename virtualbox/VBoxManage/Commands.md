# Commands

## List

### Properties

```sh
VBoxManage list systemproperties
```

### Virtual Machines

```sh
VBoxManage list vms
```

## Start

```sh
VBoxManage startvm [uuid|vmname]
```

## Control VM

```sh
VBoxManage controlvm [uuid|vmname] savestate
VBoxManage controlvm [uuid|vmname] pause
VBoxManage controlvm [uuid|vmname] resume
```

## Property

### Set

```sh
VBoxManage setproperty machinefolder '[/path/to/directory/VirtualBox VMs]'
```

## Modify HD

```sh
VBoxManage modifyhd [uuid|filename]
```

## Modify VM

```sh
VBoxManage modifyvm [uuid|vmname]
```
