# Keel

## Helm

### References

- [Configuration](https://github.com/keel-hq/keel/tree/master/chart/keel#configuration)

### Repository

```sh
helm repo add keel https://charts.keel.sh
helm repo update keel
```

### Install

```sh
kubectl create namespace keel
```

```sh
helm install keel/keel \
  -n keel \
  --namespace keel \
  --set ingress.enabled=true \
  --set "ingress.hosts[0].host=keel.$(minikube ip).nip.io" \
  --set 'ingress.hosts[0].paths={/}'
```

### SSL

### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

#### Create

TODO

#### Remove

TODO

### Status

```sh
kubectl rollout status deploy/keel -n keel
```

### Logs

```sh
kubectl logs -l 'app=keel' -n keel -f
```

### DNS

```sh
dig @10.96.0.10 keel.keel.svc.cluster.local +short
nslookup keel.keel.svc.cluster.local 10.96.0.10
```

#### ExternalDNS

```sh
dig @10.96.0.10 "keel.$(minikube ip).nip.io" +short
nslookup "keel.$(minikube ip).nip.io" 10.96.0.10
```

<!-- ### Secret

```sh
kubectl get secret keel \
  -o jsonpath='{.data.admin-password}' \
  -n keel | \
    base64 --decode; echo
``` -->

### Delete

```sh
helm delete keel --purge
kubectl delete namespace keel --grace-period=0 --force
```
