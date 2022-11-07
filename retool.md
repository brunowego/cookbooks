# Retool

**Keywords:** Low-Code

## Links

- [Code Repository](https://github.com/tryretool/retool-onpremise)
- [Main Website](https://retool.com/)
- [Integrations](https://retool.com/integrations/)

## Helm

### References

- [Helm Repository](https://github.com/tryretool/retool-helm)

### Repository

```sh
helm repo add retool 'https://charts.retool.com'
helm repo update
```

### Install

```sh
#
kubectl create ns retool

#
export RETOOL_LICENSE_KEY=''
export KUBERNETES_IP='127.0.0.1'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install retool retool/retool \
  --namespace retool \
  --version 4.6.0 \
  -f <(cat << EOF
config:
  licenseKey: $RETOOL_LICENSE_KEY

image:
  tag: latest

ingress:
  enabled: true
  hostName: retool.$DOMAIN

resources:
  limits:
    cpu: 500m
    memory: 500Mi
  requests:
    cpu: 500m
    memory: 500Mi

persistentVolumeClaim:
  enabled: true
EOF
)
```

### Status

```sh
kubectl rollout status deploy/retool \
  -n retool
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=retool' \
  -n retool \
  -f
```

### Delete

```sh
helm uninstall retool \
  -n retool

kubectl delete ns retool
```
