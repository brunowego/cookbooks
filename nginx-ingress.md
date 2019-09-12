# NGINX Ingress

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/nginx-ingress#configuration)

### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

### Install

```sh
kubectl create namespace nginx-ingress
```

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n default
```

```sh
helm install stable/nginx-ingress \
  -n nginx-ingress \
  --namespace nginx-ingress \
  --set controller.extraArgs.default-ssl-certificate='default/example.tls-secret'
```

### Status

```sh
kubectl rollout status deploy/nginx-ingress-controller -n nginx-ingress
```

#### Logs

```sh
kubectl logs -l 'app=nginx-ingress' -n nginx-ingress -f
```

### Delete

```sh
helm delete nginx-ingress --purge
kubectl delete namespace nginx-ingress --grace-period=0 --force

kubectl delete secret example.tls-secret -n default
```
