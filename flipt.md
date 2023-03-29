# Flipt

**Keywords:** Feature Toggle, Feature Flag

## Links

- [Code Repository](https://github.com/flipt-io/flipt)
- [Main Website](https://flipt.io)
- [Examples](https://github.com/flipt-io/flipt/tree/main/examples)

## Library

### Installation

```sh
# Using pnpm
pnpm add @flipt-io/flipt
```

## Helm

### References

- [Configuration](https://github.com/grafana/helm-charts/tree/main/charts/grafana#configuration)

### Repository

```sh
helm repo add flipt 'https://helm.flipt.io'
helm repo update
```

### Install

```sh
#
kubectl create ns flipt
# kubectl create ns feature-flag

#
kubens flipt

#
helm search repo -l flipt/flipt

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install flipt flipt/flipt \
  --version 0.28.1 \
  -f <(cat << EOF
ingress:
  enabled: true
  className: nginx
  hosts:
    - host: flipt.${DOMAIN}
      paths:
        - path: /
          pathType: ImplementationSpecific
EOF
)
```

### Status

```sh
kubectl rollout status deploy/flipt
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=flipt' \
  -f
```

### Delete

```sh
helm uninstall flipt

kubectl delete ns flipt \
  --grace-period=0 \
  --force
```
