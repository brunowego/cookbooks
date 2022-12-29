# Appsmith

**Keywords:** LCDP

## Links

- [Code Repository](https://github.com/appsmithorg/appsmith)
- [Main Website](https://appsmith.com)

## Helm

### References

- [Parameters](https://github.com/bitnami/charts/tree/main/bitnami/appsmith#parameters)

### Repository

```sh
helm repo add bitnami 'https://charts.bitnami.com/bitnami'
helm repo update
```

### Install

```sh
#
kubectl create ns appsmith-system
# kubectl create ns lowcode

#
helm search repo -l bitnami/appsmith

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install appsmith bitnami/appsmith \
  --namespace appsmith-system \
  --version 0.1.3 \
  -f <(cat << EOF
global:
  storageClass:
client:
  ingress:
    enabled: true
    hostname: appsmith.${DOMAIN}
    ingressClassName: nginx

  service:
    type: ClusterIP
EOF
)

#
kubectl get all -n appsmith-system
```

### Status

```sh
kubectl rollout status deployment/appsmith-backend \
  -n appsmith-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/component=backend,app.kubernetes.io/instance=appsmith' \
  -n appsmith-system \
  -f
```

### Secret

<!--
user
-->

```sh
kubectl get secret appsmith-backend \
  -o jsonpath='{.data.admin-password}' \
  -n appsmith-system | \
    base64 -d; echo
```

### Delete

```sh
helm uninstall appsmith \
  -n appsmith-system

kubectl delete ns appsmith-system \
  --grace-period=0 \
  --force
```
