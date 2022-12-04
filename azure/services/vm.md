# Azure Virtual Machines (VM)

## Docs

- [Common Azure CLI commands for managing Azure resources](https://learn.microsoft.com/en-us/azure/virtual-machines/linux/cli-manage)
- [B-series burstable virtual machine sizes](https://learn.microsoft.com/en-us/azure/virtual-machines/sizes-b-series-burstable)

## CLI

### Commands

```sh
az vm -h
```

### Usage

```sh
#
az vm list

#
az vm list-sizes

#
az vm list-usage

#
az vm image list
az vm image list -s WordPress --all
az vm image list -p Microsoft --all
```

<!--
#
az group create --name myResourceGroup \

#
az vm create \
  --resource-group myResourceGroup \
  --name MyVM1 \
  --image UbuntuLTS

#
az vm list-ip-addresses -g <rg> -n <name>

#
az vm open-port --port 80 -g <rg> -n <name>

#
az vm create \
  --resource-group myResourceGroup \
  \
  --name MyVM2 \
  --image win2016datacenter

#
az vm start --resource-group myResourceGroup --name MyVM1
az vm stop --resource-group myResourceGroup --name MyVM1
az vm deallocate --resource-group myResourceGroup --name MyVM1
az vm restart --resource-group myResourceGroup --name MyVM1
az vm redeploy --resource-group myResourceGroup --name MyVM1
az vm delete --resource-group myResourceGroup --name MyVM1

#
az vm show --resource-group myResourceGroup --name MyVM1

#
az vm disk attach --resource-group myResourceGroup --vm-name MyVM1 --disk myDataDisk --size-gb 128 --new

#
az vm disk detach --resource-group myResourceGroup --vm-name MyVM1 --disk myDataDisk

#
az disk update --resource-group myResourceGroup --name myDataDisk --size-gb 256

#
az snapshot create --resource-group myResourceGroup --name mySnapshot --source myDataDisk

#
az image create --resource-group myResourceGroup --source myVM --name myImage

#
az vm create --resource-group myResourceGroup --name myVM --image myImage
-->
