# Flagsmith

**Keywords:** Feature Toggle, Feature Flag

## Links

- [Code Repository](https://github.com/Flagsmith/flagsmith)
- [Main Website](https://flagsmith.com)
- [Docs](https://docs.flagsmith.com)

## Helm

### References

- [Helm Chart](https://github.com/Flagsmith/flagsmith-charts/tree/main/charts/flagsmith)

### Repository

```sh
helm repo add flagsmith 'https://flagsmith.github.io/flagsmith-charts/'
helm repo update
```

### Install

```sh
#
kubectl create ns flagsmith

#
kubens flagsmith

#
helm search repo -l flagsmith

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install flagsmith flagsmith/flagsmith \
  --version 0.15.0 \
  -f <(cat << EOF
ingress:
  frontend:
    enabled: true
    hosts:
    - host: flagsmith.${DOMAIN}
      paths: ['/']

  api:
    enabled: true
    hosts:
    - host: api.flagsmith.${DOMAIN}
      paths: ['/']
EOF
)
```

### Status

```sh
kubectl rollout status deploy/flagsmith
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/component=api' \
  -c flagsmith-api \
  -f

kubectl logs \
  -l 'app.kubernetes.io/component=frontend' \
  -f
```

### Delete

```sh
helm uninstall flagsmith

kubectl delete ns flagsmith
```
