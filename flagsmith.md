# Flagsmith

<!--
https://kubernetes.io/docs/reference/command-line-tools-reference/feature-gates/

https://configcat.com/
-->

**Keywords:** Feature Toggle, Feature Flag

## Links

- [Code Repository](https://github.com/Flagsmith/flagsmith)
- [Main Website](https://flagsmith.com/)
- [Docs](https://docs.flagsmith.com/)

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
kubectl create ns flagsmith-system

#
export KUBERNETES_IP='127.0.0.1'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install flagsmith flagsmith/flagsmith \
  --namespace flagsmith-system \
  --version 0.4.0 \
  -f <(cat << EOF
api:
  limits:
    cpu: 500m
    memory: 500Mi
  requests:
    cpu: 300m
    memory: 300Mi
frontend:
  limits:
    cpu: 500m
    memory: 500Mi
  requests:
    cpu: 300m
    memory: 300Mi
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
kubectl rollout status deploy/flagsmith \
  -n flagsmith-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=flagsmith' \
  -n flagsmith-system \
  -f
```

### Delete

```sh
helm uninstall flagsmith \
  -n flagsmith-system

kubectl delete ns flagsmith-system
```
