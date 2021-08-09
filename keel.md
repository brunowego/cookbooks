# Keel

Kubernetes Operator to automate Helm, DaemonSet, StatefulSet & Deployment updates.

## Links

- [Code Repository](https://github.com/keel-hq/keel)
- [Main Website](https://keel.sh/)

## Helm

### References

- [Configuration](https://github.com/keel-hq/keel/tree/master/chart/keel#configuration)

### Repository

```sh
helm repo add keel 'https://charts.keel.sh'
helm repo update
```

### Install

```sh
#
export INGRESS_HOST='127.0.0.1'

#
helm install keel keel/keel \
  --namespace kube-system \
  --version 0.9.8 \
  -f <(cat << EOF
ingress:
  enabled: true
  hosts:
  - host: keel.${INGRESS_HOST}.nip.io
    paths:
    - /
EOF
)
```

### Status

```sh
kubectl rollout status deploy/keel \
  -n kube-system
```

### Logs

```sh
kubectl logs \
  -l 'app=keel' \
  -n kube-system \
  -f
```

<!-- ### Secret

```sh
kubectl get secret keel \
  -o jsonpath='{.data.admin-password}' \
  -n keel | \
    base64 --decode; echo
``` -->

### Delete

```sh
helm uninstall keel \
  -n kube-system
```
