# Hajimari

## Links

- [Code Repository](https://github.com/toboshii/hajimari)
- [Main Website](https://hajimari.io)

## Helm

### References

- [Values](https://github.com/toboshii/hajimari/tree/main/charts/hajimari#values)

### Repository

```sh
helm repo add hajimari 'https://hajimari.io'
helm repo update
```

### Install

```sh
#
kubectl create ns hajimari

#
kubens hajimari

#
helm search repo -l hajimari/hajimari

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install hajimari hajimari/hajimari \
  --version 2.0.2 \
  -f <(cat << EOF
ingress:
  main:
    enabled: true
    hosts:
      - host: hajimari.${K8S_DOMAIN}
        paths:
          - path: /
            pathType: Prefix
EOF
)
```

### Status

```sh
kubectl rollout status deploy/hajimari
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=hajimari' \
  -f
```

### Delete

```sh
helm uninstall hajimari

kubectl delete ns hajimari \
  --grace-period=0 \
  --force
```
