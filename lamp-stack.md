# LAMP Stack (Linux, Apache, MySQL, PHP)

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/lamp#configuration)

### Install

```sh
kubectl create namespace lamp
```

```sh
helm install stable/lamp \
  -n lamp \
  --namespace lamp \
  --set service.type=ClusterIP \
  --set ingress.enabled=true \
  --set ingress.domain=lamp.$(minikube ip).nip.io
```

### SSL

#### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

#### Create

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n lamp
```

```sh
helm upgrade lamp stable/lamp -f <(yq m <(cat << EOF
ingress:
  tls:
    - secretName: example.tls-secret
      hosts:
        - lamp.$(minikube ip).nip.io
EOF
) <(helm get values lamp))
```

#### Remove

```sh
helm upgrade lamp stable/lamp -f <(yq d <(helm get values lamp) ingress.tls)

kubectl delete secret example.tls-secret -n lamp
```

### Status

```sh
kubectl rollout status deploy/lamp -n lamp
```

### Logs

```sh
kubectl logs -l 'app=lamp' -n lamp -f
```

### DNS

```sh
dig @10.96.0.10 lamp.lamp.svc.cluster.local +short
nslookup lamp.lamp.svc.cluster.local 10.96.0.10
```

#### ExternalDNS

```sh
dig @10.96.0.10 "lamp.$(minikube ip).nip.io" +short
nslookup "lamp.$(minikube ip).nip.io" 10.96.0.10
```

### Secret

```sh
kubectl get secret lamp \
  -o jsonpath='{.data.admin-password}' \
  -n lamp | \
    base64 --decode; echo
```

### Delete

```sh
helm delete lamp --purge
kubectl delete namespace lamp --grace-period=0 --force
```
