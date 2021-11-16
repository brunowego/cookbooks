# LAMP Stack (Linux, Apache, MySQL, PHP)

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/lamp#configuration)

### Install

```sh
kubectl create ns lamp
```

```sh
helm install lamp stable/lamp \
  --namespace lamp \
  --set service.type=ClusterIP \
  --set ingress.enabled=true \
  --set ingress.domain=lamp.${DOMAIN}
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
        - lamp.${DOMAIN}
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
dig @10.96.0.10 "lamp.${DOMAIN}" +short
nslookup "lamp.${DOMAIN}" 10.96.0.10
```

### Secret

```sh
kubectl get secret lamp \
  -o jsonpath='{.data.admin-password}' \
  -n lamp | \
    base64 -d; echo
```

### Delete

```sh
helm uninstall lamp -n lamp
kubectl delete ns lamp --grace-period=0 --force
```
