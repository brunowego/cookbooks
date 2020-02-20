# HAProxy Ingress

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/incubator/haproxy-ingress#configuration)

### Repository

```sh
helm repo add incubator http://storage.googleapis.com/kubernetes-charts-incubator
helm repo update incubator
```

### Install

```sh
helm install incubator/haproxy-ingress \
  -n haproxy-ingress \
  --namespace kube-system
```

### Status

```sh
kubectl rollout status deploy/haproxy-ingress-controller -n kube-system
```

### Logs

```sh
kubectl logs -l 'app=haproxy-ingress,component=controller' -n kube-system -f
kubectl logs -l 'app=haproxy-ingress,component=default-backend' -n kube-system -f
```

### DNS

```sh
dig @10.96.0.10 haproxy-ingress-controller.kube-system.svc.cluster.local +short
nslookup haproxy-ingress-controller.kube-system.svc.cluster.local 10.96.0.10
```

### Delete

```sh
helm delete haproxy-ingress --purge
```
