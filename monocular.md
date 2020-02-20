# Monocular

## Helm

### Dependencies

- [NGINX Ingress](/nginx-ingress.md)
- [Kubernetes TLS Secret](/k8s-tls-secret.md)

### Repository

```sh
helm repo add monocular https://helm.github.io/monocular
helm repo update monocular
```

### Install

```sh
kubectl create namespace monocular
```

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n monocular
```

```sh
helm install monocular/monocular \
  -n monocular \
  --namespace monocular \
  --set ingress.hosts={monocular.example.com} \
  --set ingress.tls.secretName=example.tls-secret \
  --set 'sync.repos[0].name=example' \
  --set 'sync.repos[0].url=https://chartmuseum.example.com'
```

### Status

```sh
kubectl rollout status deploy/monocular-monocular-chartsvc -n monocular
```

### Custom Repo

```sh
helm upgrade monocular monocular/monocular -f <(yq m <(cat << EOF
sync:
  repos:
    - name: example
      url: https://chartmuseum.example.com
      schedule: '*/5 * * * *'
EOF
) <(helm get values monocular))
```

```sh
kubectl delete pod -l 'app=mongodb' -n monocular
```

```sh
kubectl rollout status deploy/monocular-monocular-chartsvc -n monocular
```

### Delete

```sh
helm delete monocular --purge
kubectl delete namespace monocular --grace-period=0 --force
```
