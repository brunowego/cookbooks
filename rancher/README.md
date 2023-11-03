# Rancher

<!--
https://github.com/rancher-sandbox/rancher-desktop
-->

**Keywords:** Kubernetes Management, Kubernetes Orchestration

## Links

- [Code Repository](https://github.com/rancher/rancher)
- [Code Repository - CLI](https://github.com/rancher/cli)

## Helm

### References

- [Options](https://github.com/rancher/rancher/tree/master/chart#helm-chart-options-for-kubernetes-installations)

### Dependencies

- [NGINX Ingress Controller](/nginx/ingress-controller/README.md#helm)
- [cert-manager](/cert-manager/README.md#helm)

### Repository

```sh
helm repo add rancher-latest 'https://releases.rancher.com/server-charts/latest'
helm repo update
```

### Install

```sh
#
kubectl create ns rancher-system

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install rancher rancher-latest/rancher \
  --namespace rancher-system \
  --version 2.6.2 \
  -f <(cat << EOF
hostname: rancher.${K8S_DOMAIN}
EOF
)
```

### Status

```sh
kubectl rollout status deploy/rancher \
  -n rancher-system
```

### Logs

```sh
kubectl logs \
  -l 'app=rancher' \
  -n rancher-system \
  -f
```

### Secret

```sh
kubectl get secret bootstrap-secret \
  -o jsonpath='{.data.bootstrapPassword}' \
  -n rancher-system | \
    base64 -d; echo
```

### Delete

```sh
helm uninstall rancher \
  -n rancher-system

kubectl patch namespace rancher-system \
  -p '{"metadata":{"finalizers":[]}}' \
  --type='merge'

kubectl delete ns rancher-system \
  --grace-period=0 \
  --force

kubectl patch namespace rancher-fleet-local-system \
  -p '{"metadata":{"finalizers":[]}}' \
  --type='merge'

kubectl delete ns rancher-fleet-local-system \
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
  https://<url> \
  -t <token>
```

<!-- ## Issues -->

<!-- ### Host Resolve

```log
INFO: Using resolv.conf: nameserver 10.254.1.134 nameserver 172.17.10.57 nameserver 10.8.4.1 search xyz.tld
ERROR: https://rancher.xyz.tld/ping is not accessible (Could not resolve host: rancher.xyz.tld)
```

```sh
# sudo vim /etc/resolv.conf
# search rancher.rancher-system.svc.cluster.local rancher-system.svc.cluster.local svc.cluster.local cluster.local

sudo hostess add rancher.xyz.tld 10.254.1.88

sudo systemctl restart kubelet

for pod in `kubectl get pods -o json -n rancher-system | jq -r '.items[] | select(.metadata.labels.app | contains("cattle-agent")) | .metadata.name'`; do kubectl delete pod $pod -n rancher-system; done

kubectl delete pod \
  -l 'app=cattle-cluster-agent' \
  -n rancher-system
``` -->
