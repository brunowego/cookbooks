# chaoskube

**Keywords:** Chaos Engineering, Chaos Monkey

## Links

- [Code Repository](https://github.com/linki/chaoskube)

<!--
https://github.com/linki/chaoskube
-->

<!-- ## Helm

### Install

```sh
kubectl create ns chaoskube

helm install chaoskube stable/chaoskube \
  --namespace chaoskube \
  --set rbac.create=true

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
helm uninstall chaoskube \
  -n chaoskube

kubectl delete ns chaoskube \
  --grace-period=0 \
  --force
``` -->
