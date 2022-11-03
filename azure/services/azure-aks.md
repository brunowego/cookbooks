# Azure Kubernetes Service (AKS)

<!--
https://app.pluralsight.com/paths/skills/managing-and-orchestrating-containers-with-azure-kubernetes-service-aks
-->

## Glossary

- Fully-Qualified Domain Name (FQDN)
- Tab-Separated Values (TSV)

## CLI

### Commands

```sh
az aks -h
```

### Usage

```sh
#
az aks list

#
az aks get-credentials \
  --name "$(az aks list --query '[].name' -o tsv)" \
  --resource-group "$(az aks list --query '[].{resourceGroup:resourceGroup}' -o tsv)" \
  --admin

#
kubectl config view
```

### Issues

#### Missing Subscription

```log
(SubscriptionNotFound) The subscription '<UUID>' could not be found.
Code: SubscriptionNotFound
Message: The subscription '<UUID>' could not be found.
```

TODO

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
