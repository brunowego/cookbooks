# Crane

**Keywords:** FinOps

## Links

- [Code Repository](https://github.com/gocrane/crane)
- [Main Website](https://gocrane.io/)

## Helm

### References

- [Configuration](https://github.com/gocrane/helm-charts/tree/main/charts/crane#configuration)

### Repository

```sh
helm repo add crane 'https://gocrane.github.io/helm-charts'
helm repo update
```

### Install

```sh
#
kubectl create ns crane-system
# kubectl create ns finops

#
helm search repo -l crane/crane

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install crane crane/crane \
  --namespace crane-system \
  --version 0.8.0

#
kubectl get all -n crane-system
```

<!-- ### Status

```sh
kubectl rollout status statefulset/crane-crane \
  -n crane-system
``` -->

<!-- ### Logs

```sh
kubectl logs \
  -l 'app=crane' \
  -n crane-system \
  -f
``` -->

### Delete

```sh
helm uninstall crane \
  -n crane-system

kubectl delete ns crane-system \
  --grace-period=0 \
  --force
```
