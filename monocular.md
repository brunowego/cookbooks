# Monocular

## Helm

### Dependencies

- [NGINX Ingress](/nginx-ingress.md)
- [Kubernetes TLS Secret](/k8s-tls-secret.md)

### Repository

```sh
helm repo add monocular https://helm.github.io/monocular
helm repo update
```

### Install

```sh
kubectl create ns monocular
```

```sh
kubectl create secret tls monocular.tls-secret \
  --cert='/etc/ssl/certs/monocular/root-ca.crt' \
  --key='/etc/ssl/private/monocular/root-ca.key' \
  -n monocular
```

```sh
helm install monocular monocular/monocular \
  --namespace monocular \
  --set ingress.hosts={monocular.domain.tld} \
  --set ingress.tls.secretName=monocular.tls-secret \
  --set 'sync.repos[0].name=example' \
  --set 'sync.repos[0].url=https://chartmuseum.domain.tld'
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
      url: https://chartmuseum.domain.tld
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
helm uninstall monocular -n monocular
kubectl delete ns monocular --grace-period=0 --force
```
