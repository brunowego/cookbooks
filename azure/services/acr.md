# Azure Container Registry (ACR)

## Console

- [All services](https://portal.azure.com/#allservices/category/All)
  - Categories / Containers
    - Container registries

## Glossary

- Open Container Initiative (OCI)

## CLI

### Commands

```sh
az acr -h
```

### Usage

```sh
#
az acr list

#
az acr repository list -n <registry-name>

#
az acr repository show \
  -n <registry-name> \
  --repository <name>

#
az acr repository show \
  -n <registry-name> \
  --repository <name>

#
az acr repository show \
  -n <registry-name> \
  -t <image-name>
```

<!--
az acr create -n reactordemo -g wasmRG --sku Standard
az acr update --name reactordemo --anonymous-pull-enabled
az acr import \
  --name myregistry \
  --source docker.io/library/hello-world:latest \
  --image hello-world:latest
-->

### Tips

#### Docker Registry Login

**Dependencies:** Docker needs to be running.

```sh
#
az acr list

#
az acr login -n <registry-name>

#
cat ~/.docker/config.json
```

#### Namespace Docker Registry Secret

```sh
#
az acr credential show -n <registry-name>

#
kubens <namespace>

#
kubectl create secret docker-registry <my-org>-docker-registry \
  --docker-server='https://<registry-name>.azurecr.io' \
  --docker-username='<username>' \
  --docker-password='<password>'

#
kubectl get secret <my-org>-docker-registry \
  -o jsonpath='{.data.\.dockerconfigjson}' | \
    base64 -d | jq .
```

#### Get Registry Credentials

```sh
#
az acr credential show -n <registry-name>

#
az acr credential show \
  -n <registry-name> \
  -o tsv \
  --query 'passwords[0].value'
```
