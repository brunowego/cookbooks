# chaoskube

## Helm

### Install

```sh
kubectl create namespace chaoskube
```

```sh
helm install stable/chaoskube \
  -n chaoskube \
  --namespace chaoskube \
  --set rbac.create=true
```

```sh
kubectl rollout status deploy/chaoskube -n chaoskube
```

```sh
kubectl logs -f $(kubectl get pods -l 'app.kubernetes.io/instance=chaoskube' -o jsonpath='{.items[0].metadata.name}' -n chaoskube) -n chaoskube
```

### Commands

```sh
kubectl exec -it \
  $(kubectl get pod -l 'app.kubernetes.io/name=chaoskube' -o jsonpath='{.items[0].metadata.name}' -n chaoskube) \
  -n chaoskube \
  -- chaoskube --help
```

### Delete

```sh
helm delete chaoskube --purge
kubectl delete namespace chaoskube --grace-period=0 --force
```
