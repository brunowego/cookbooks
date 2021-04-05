# NiFiKop

## References

- [Apache NiFi](/apache_nifi.md)

## Helm

### References

- [Configuration](https://github.com/Orange-OpenSource/nifikop/tree/master/helm/nifikop#configuration)

### Repository

```sh
helm repo add orange-incubator https://orange-kubernetes-charts-incubator.storage.googleapis.com/
helm repo update
```

### Install

```sh
kubectl create namespace nifi
```

```sh
helm install nifikop orange-incubator/nifikop \
  --replace \
  --namespace nifi \
  --version 0.5.3 \
  --set image.tag=v0.5.3-release \
  --set resources.requests.memory=256Mi \
  --set resources.requests.cpu=250m \
  --set resources.limits.memory=256Mi \
  --set resources.limits.cpu=250m \
  --set securityContext={} \
  --set namespaces={'nifi'}
```

### Status

```sh
kubectl get pod -l 'release=nifikop' -n nifi
```

### Logs

```sh
kubectl logs -l 'app=nifikop' -n nifi -f
```

### Delete

```sh
helm uninstall nifikop -n nifi

kubectl delete namespace nifi --grace-period=0 --force
```
