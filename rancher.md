# Rancher

<!--
rke
-->

## Helm

### References

- [Helm Chart](https://github.com/rancher/rancher/tree/master/chart)

### Dependencies

- [NGINX Ingress](/nginx-ingress.md)
- [Kubernetes TLS Secret](/k8s-tls-secret.md)

### Repository

```sh
helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
helm repo update rancher-latest
```

### Install

```sh
kubectl create namespace cattle-system
```

```sh
kubectl create secret tls tls-rancher-ingress \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n cattle-system
```

```sh
helm install rancher-latest/rancher \
  -n rancher \
  --namespace cattle-system \
  --set hostname=rancher.example.com \
  --set ingress.tls.source=secret
```

### Status

```sh
kubectl rollout status deploy/rancher -n cattle-system
```

### Delete

```sh
helm delete rancher --purge
```

```sh
kubectl patch namespace cattle-system -p '{"metadata":{"finalizers":[]}}' --type='merge'
kubectl delete namespace cattle-system --grace-period=0 --force
```

```sh
kubectl patch namespace cattle-global-data -p '{"metadata":{"finalizers":[]}}' --type='merge'
kubectl delete namespace cattle-global-data --grace-period=0 --force
```

```sh
kubectl patch namespace local -p '{"metadata":{"finalizers":[]}}' --type='merge'

for resource in `kubectl api-resources --namespaced -o name --verbs=list | xargs -n 1 kubectl get -o name -n local`; do kubectl patch $resource -p '{"metadata":{"finalizers":[]}}' --type='merge' -n local; done

kubectl delete namespace local --grace-period=0 --force
```

```sh
# Remove manually another namespaces prefixed by `p-`.
kubectl get namespaces

kubectl patch namespace p-xxxxx -p '{"metadata":{"finalizers":[]}}' --type='merge'
kubectl delete namespace p-xxxxx --grace-period=0 --force
```

<!-- ```sh
for crd in `kubectl get crd -o json | jq -r '.items[] | select(.spec.group | contains("cattle.io")) | .metadata.name'`; do for cr in `kubectl get $crd -o name`; do kubectl patch $cr -p '{"metadata":{"finalizers":[]}}' --type='merge'; done; done

for crd in `kubectl get crd -o json | jq -r '.items[] | select(.spec.group | contains("cattle.io")) | .metadata.name'`; do for cr in `kubectl get $crd -o name`; do kubectl delete $cr; done; done
``` -->

```sh
for crd in `kubectl get crd -o json | jq -r '.items[] | select(.spec.group | contains("cattle.io")) | .metadata.name'`; do kubectl patch crd $crd -p '{"metadata":{"finalizers":[]}}' --type='merge'; done

for crd in `kubectl get crd -o json | jq -r '.items[] | select(.spec.group | contains("cattle.io")) | .metadata.name'`; do kubectl delete crd $crd; done
```

<!-- ```sh
for crd in `kubectl get crd -o json | jq -r '.items[] | select(.spec.group | contains("monitoring.coreos.com")) | .metadata.name'`; do kubectl delete crd $crd; done
``` -->

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h rancher \
  -v rancher-data:/var/lib/rancher \
  -p 8080:80 \
  -p 8443:443 \
  --name rancher \
  rancher/rancher:v2.2.4
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```shm
docker rm -f rancher
docker volume rm rancher-data
```

## Issues

###

>

1. Cluster
2. Edit
3. Save

###

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

kubectl delete pod -l 'app=cattle-cluster-agent' -n cattle-system
```
