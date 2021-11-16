# Focalboard

## Links

- [Code Repository](https://github.com/mattermost/focalboard)
- [Main Website](https://focalboard.com)

## Helm

### References

- [Chart Repository](https://github.com/mattermost/mattermost-helm/tree/master/charts/focalboard)

### Repository

```sh
helm repo add mattermost 'https://helm.mattermost.com'
helm repo update
```

### Install

```sh
#
kubectl create ns focalboard

#
export KUBERNETES_IP='127.0.0.1'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install focalboard mattermost/focalboard \
  --namespace focalboard \
  --version 0.4.0 \
  -f <(cat << EOF
ingress:
  enabled: true
  hosts:
  - host: focalboard.${DOMAIN}
    paths:
      - path: /

persistence:
  enabled: true
  accessMode: ReadWriteOnce
  size: 8Gi

resources:
  requests:
    cpu: 100m
    memory: 128Mi
  limits:
    cpu: 150m
    memory: 256Mi
EOF
)
```

### Fix

```sh
kubectl set env deployment/focalboard FOCALBOARD_PORT=8000
```

### Status

```sh
kubectl rollout status deploy/focalboard \
  -n focalboard
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=focalboard' \
  -n focalboard \
  -f
```

### Delete

```sh
helm uninstall focalboard \
  -n focalboard

kubectl delete ns focalboard \
  --grace-period=0 \
  --force
```
