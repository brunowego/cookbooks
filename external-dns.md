# ExternalDNS

## References

- [Frequently asked questions](https://github.com/kubernetes-incubator/external-dns/blob/master/docs/faq.md#user-content-are-other-ingress-controllers-supported)
- [Tutorials](https://github.com/kubernetes-incubator/external-dns/tree/master/docs/tutorials)

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/external-dns#configuration)

### Dependencies

- [etcd (Bitnami)](/etcd.md) or [etcd Operator](/etcd-operator.md)
- [CoreDNS](/coredns.md)

### Install

```sh
helm install stable/external-dns \
  -n external-dns \
  --namespace kube-system \
  --set provider=coredns \
  --set coredns.etcdEndpoints='http://etcd-cluster.kube-system.svc.cluster.local:2379' \
  --set logLevel=debug \
  --set rbac.create=true
```

### Status

```sh
kubectl rollout status deploy/external-dns -n kube-system
```

### Logs

```sh
kubectl logs -l 'app.kubernetes.io/name=external-dns' -n kube-system -f
```

### Test

#### Running

```sh
kubectl run nginx \
  --generator=run-pod/v1 \
  --image=nginx:latest \
  --replicas=1 \
  --port=80

kubectl expose pod/nginx \
  --port=80 \
  --target-port=80 \
  --type=LoadBalancer
```

#### Annotations

```sh
kubectl annotate service nginx 'external-dns.alpha.kubernetes.io/hostname=nginx.example.com.'
kubectl annotate service nginx 'external-dns.alpha.kubernetes.io/ttl=10'
```

```sh
kubectl get service nginx -o yaml
```

#### DNS

```sh
dig @10.96.0.10 nginx.example.com +short
nslookup nginx.example.com 10.96.0.10
```

#### Delete

```sh
kubectl delete service/nginx
kubectl delete pod/nginx
```

### Tips

#### Annotations

- [Are other Ingress Controllers supported?](https://github.com/kubernetes-incubator/external-dns/blob/master/docs/faq.md#user-content-are-other-ingress-controllers-supported)

```sh
kubectl annotate ingress myapp 'external-dns.alpha.kubernetes.io/target=myapp.example.com' -n kube-monitor
kubectl annotate ingress myapp 'external-dns.alpha.kubernetes.io/ttl=10' -n kube-monitor
```

### Issues

#### Wrong Endpoint

```log
time="2019-09-18T13:53:03Z" level=error msg="context deadline exceeded"
```

Wrong etcd endpoints are configured.

```sh
helm get values external-dns | yq r - coredns.etcdEndpoints
```

### Delete

```sh
helm delete external-dns --purge
```
