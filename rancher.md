# Rancher

<!--
https://github.com/rancher-sandbox/rancher-desktop
-->

## Alternatives

- [Amazon Elastic Kubernetes Service (EKS)](/aws/aws-eks.md)
- [Kubernetes Operations (kOps)](/kops.md)

## Links

- [Code Repository](https://github.com/rancher/rancher)
- [Code Repository - CLI](https://github.com/rancher/cli)

## Helm

### References

- [Helm Chart](https://github.com/rancher/rancher/tree/master/chart)

### Dependencies

- [NGINX Ingress Controller](/kubernetes/ingress-controllers/ingress-nginx/README.md#helm)
- [cert-manager](/cert-manager/README.md#helm)

### Repository

```sh
helm repo add rancher-latest 'https://releases.rancher.com/server-charts/latest'
helm repo update
```

### Install

```sh
#
kubectl create ns cattle-system

#
export INGRESS_HOST='127.0.0.1'

#
helm install rancher rancher-latest/rancher \
  --namespace cattle-system \
  --version 2.6.2 \
  -f <(cat << EOF
hostname: rancher.${INGRESS_HOST}.nip.io
EOF
)
```

### Status

```sh
kubectl rollout status deploy/rancher \
  -n cattle-system
```

### Logs

```sh
kubectl logs \
  -l 'app=rancher' \
  -n cattle-system \
  -f
```

### Secret

```sh
kubectl get secret bootstrap-secret \
  -o jsonpath='{.data.bootstrapPassword}' \
  -n cattle-system | \
    base64 --decode; echo
```

### Delete

```sh
helm uninstall rancher \
  -n cattle-system

kubectl patch namespace cattle-system \
  -p '{"metadata":{"finalizers":[]}}' \
  --type='merge'

kubectl delete ns cattle-system \
  --grace-period=0 \
  --force

kubectl patch namespace cattle-fleet-local-system \
  -p '{"metadata":{"finalizers":[]}}' \
  --type='merge'

kubectl delete ns cattle-fleet-local-system \
  --grace-period=0 \
  --force
```

> Wait! This process take a while.

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h rancher \
  -v rancher-data:/var/lib/rancher \
  -v rancher-kubelet-data:/var/lib/kubelet \
  -v rancher-log:/var/log \
  -v rancher-lib-cni:/var/lib/cni \
  -p 8080:80 \
  -p 8443:443 \
  --name rancher \
  --privileged \
  --network workbench \
  rancher/rancher:v2.6.2
```

> Wait! This process take a while.

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Secret

```sh
#
docker logs rancher 2>&1 | grep 'Bootstrap Password:'
```

### Remove

```shm
docker rm -f rancher

docker volume rm \
  rancher-data \
  rancher-kubelet-data \
  rancher-log \
  rancher-lib-cni
```

## App

### Dependencies

Uninstall Pre-existing Versions of [Helm](/helm/README.md) and [Kubernetes Control (kubectl)](/kubectl/README.md).

### Installation

#### Homebrew

```sh
brew install rancher
```

## CLI

### Installation

#### Homebrew

```sh
brew install rancher-cli
```

### Commands

```sh
rancher -h
```

### Usage

```sh
#
rancher login \
  https://[url] \
  -t [token]
```

<!-- ## Issues -->

<!-- ### Host Resolve

```log
INFO: Using resolv.conf: nameserver 10.254.1.134 nameserver 172.17.10.57 nameserver 10.8.4.1 search example.com
ERROR: https://rancher.example.com/ping is not accessible (Could not resolve host: rancher.example.com)
```

```sh
# sudo vim /etc/resolv.conf
# search rancher.cattle-system.svc.cluster.local cattle-system.svc.cluster.local svc.cluster.local cluster.local

sudo hostess add rancher.example.com 10.254.1.88

sudo systemctl restart kubelet

for pod in `kubectl get pods -o json -n cattle-system | jq -r '.items[] | select(.metadata.labels.app | contains("cattle-agent")) | .metadata.name'`; do kubectl delete pod $pod -n cattle-system; done

kubectl delete pod \
  -l 'app=cattle-cluster-agent' \
  -n cattle-system
``` -->
