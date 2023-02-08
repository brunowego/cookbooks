# Focalboard

## Links

- [Code Repository](https://github.com/mattermost/focalboard)
- [Main Website](https://focalboard.com)

## App

<!--
https://www.focalboard.com/download/personal-edition/desktop/
-->

### Installation

#### MAS

```sh
mas install 1556908618
```

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
kubens focalboard

#
helm search repo -l mattermost/focalboard

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install focalboard mattermost/focalboard \
  --version 0.5.0 \
  -f <(cat << EOF
ingress:
  enabled: true
  hosts:
  - host: focalboard.${DOMAIN}
    paths:
      - path: /
EOF
)
```

### Fix

```sh
kubectl set env deployment/focalboard FOCALBOARD_PORT=8000
```

### Status

```sh
kubectl rollout status deploy/focalboard
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=focalboard' \
  -f
```

### Delete

```sh
helm uninstall focalboard

kubectl delete ns focalboard \
  --grace-period=0 \
  --force
```
