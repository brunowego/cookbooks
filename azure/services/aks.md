# Azure Kubernetes Service (AKS)

<!--
https://app.pluralsight.com/paths/skills/managing-and-orchestrating-containers-with-azure-kubernetes-service-aks

https://github.com/search?o=desc&q=path%3Amodules%2Faks+filename%3Amain.tf&s=indexed&type=Code

https://github.com/jstarman/aks-bootstrap/tree/main/modules
https://github.com/GimhanDissanayake/terraform-azure/tree/main/modules
https://github.com/ghdo-canuto/envolve/tree/main/modules
https://github.com/kabirajpratihari/iac-terraform-promotion/tree/main/modules
https://github.com/jstarman/aks-bootstrap/tree/main/modules
https://github.com/nicksc423/azure-infrastructure/tree/7a6d8db12b6814315d4c6dc172d169cf388409de/modules
https://github.com/nicksc423/azure-infrastructure/tree/main/modules
https://github.com/OiMoulder/Terraform-Azure-Kubernetes/tree/main/modules
-->

**Keywords:** Kubernetes Orchestration, Control Plane

## Links

- [Kubernetes Services](https://portal.azure.com/#view/HubsExtension/BrowseResource/resourceType/Microsoft.ContainerService%2FmanagedClusters)

## Glossary

- Fully-Qualified Domain Name (FQDN)
- Tab-Separated Values (TSV)

## CLI

### Commands

```sh
az aks -h
```

### Configuration

```sh
#
export AZURE_AKS_CLUSTER_NAME="$(az aks list --query '[].name' -o tsv)"
export AZURE_RESOURCE_GROUP="$(az aks list --query '[].{resourceGroup:resourceGroup}' -o tsv)"

#
az aks get-credentials \
  --name "$AZURE_AKS_CLUSTER_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --admin

#
kubectl config view
```

### Usage

```sh
#
az aks list
```

<!--
#### Create

```sh
export AZURE_AKS_CLUSTER_NAME=''

az group create \
  --name "$AZURE_RESOURCE_GROUP" \
  --location eastus

az aks create \
  --name "$AZURE_AKS_CLUSTER_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --network-plugin azure \
  --node-count 3 \
  --generate-ssh-keys \
  --vm-set-type VirtualMachineScaleSets \
  --load-balancer-sku standard

az aks nodepool add \
  --cluster-name "$AZURE_AKS_CLUSTER_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --name systempool \
  --mode system \
  --node-count 1 \
  --node-taints "CriticalAddonsOnly=true:NoSchedule" \
  --no-wait

az aks nodepool add \
  --cluster-name "$AZURE_AKS_CLUSTER_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --name userpool \
  --mode user \
  --node-count 2 \
  --node-taints "node.cilium.io/agent-not-ready=true:NoExecute" \
  --no-wait

az aks nodepool delete \
  --cluster-name "$AZURE_AKS_CLUSTER_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --name "" \
  --no-wait
```
-->

#### Node Pools

```sh
#
az aks nodepool list \
  --cluster-name "$AZURE_AKS_CLUSTER_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP"

#
az aks nodepool show \
  --cluster-name "$AZURE_AKS_CLUSTER_NAME" \
  --name 'worker' \
  --resource-group "$AZURE_RESOURCE_GROUP"

#
az aks nodepool scale \
  --cluster-name "$AZURE_AKS_CLUSTER_NAME" \
  --name 'worker' \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --node-count 3
```

#### Upgrade

```sh
#
az aks get-upgrades \
  --name "$AZURE_AKS_CLUSTER_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP"

az aks nodepool upgrade \
  --cluster-name "$AZURE_AKS_CLUSTER_NAME" \
  --name mynodepool \
  --resource-group "$AZURE_RESOURCE_GROUP"
  -k 'kubernetes-version' \
  --no-wait
```

### Issues

#### Missing Clusters

```log
No such key 'clusters' in existing config, please confirm whether it is a valid config file. May back up this config file, delete it and retry the command.
```

```sh
tee -a "$HOME"/.kube/config << EOF
clusters: {}
users: {}
contexts: {}
EOF
```
