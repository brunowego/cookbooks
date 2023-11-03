# ZITADEL

**Keywords:** Identity Provider (IdP), IAM

## Links

- [Code Repository](https://github.com/zitadel/zitadel)
- [Main Website](https://zitadel.com)

## Helm

**WIP:** Currently not working as expected.

### References

- [Helm Chart](https://github.com/zitadel/zitadel-charts/tree/main/charts/zitadel)

### Repository

```sh
helm repo add zitadel 'https://charts.zitadel.com'
helm repo update
```

### Install

```sh
#
kubectl create ns zitadel-system
# kubectl create ns security

#
helm search repo -l zitadel/zitadel

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
[[ -n "${DOMAIN}" ]] && LC_CTYPE=C helm upgrade zitadel zitadel/zitadel \
  --namespace zitadel-system \
  --version 3.5.0 \
  -f <(cat << EOF
zitadel:
  configmapConfig:
    ExternalSecure: false
    TLS:
      Enabled: false

  secretConfig:
    Database:
      cockroach:
        User:
          Password: zitadel

  masterkey: $(date +%s | sha256sum | base64 | head -c 32)

replicaCount: 1

ingress:
  enabled: true
  className: nginx
  hosts:
    - host: zitadel.${K8S_DOMAIN}
      paths:
        - path: /
          pathType: Prefix

# env:
#   - name: ZITADEL_EXTERNAL_DOMAIN
#     value: zitadel.${K8S_DOMAIN}

cockroachdb:
  single-node: true
  statefulset:
    replicas: 1
EOF
)

#
kubectl get all -n zitadel-system
```

<!--
kubectl port-forward \
  --address 0.0.0.0 \
  -n zitadel-system \
  svc/zitadel \
  8080:8080
-->

### Status

```sh
kubectl rollout status deployment/zitadel \
  -n zitadel-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/component=cockroachdb,app.kubernetes.io/instance=zitadel' \
  -n zitadel-system \
  -f

kubectl logs \
  -l 'app.kubernetes.io/instance=zitadel,app.kubernetes.io/name=zitadel' \
  -n zitadel-system \
  -f
```

### Delete

```sh
helm uninstall zitadel \
  -n zitadel-system

kubectl delete ns zitadel-system \
  --grace-period=0 \
  --force
```
