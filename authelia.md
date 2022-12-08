# Authelia

## Links

- [Code Repository](https://github.com/authelia/authelia)
- [Main Website](https://authelia.com/)

## Helm

**WIP:** Currently not working as expected.

### Dependencies

- [Redis](/redis/redis-cluster.md#helm)
- [PostgreSQL](/postgresql/server.md#helm)

### References

- [Parameters](https://github.com/authelia/chartrepo/tree/master/charts/authelia#parameters)

### Repository

```sh
helm repo add authelia 'https://charts.authelia.com'
helm repo update
```

### Install

```sh
#
kubectl create ns authelia-system
# kubectl create ns auth

#
helm search repo -l authelia/authelia

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install authelia authelia/authelia \
  --namespace authelia-system \
  --version 0.8.46 \
  -f <(cat << EOF
domain: ${DOMAIN}

# authentication_backend:
#   ldap:
#     url: ldap://openldap.default.svc.cluster.local

ingress:
  enabled: true
  className: nginx
  hosts:
  - name: auth

configMap:
  session:
    redis:
      host: redis-cluster.redis-system.svc.cluster.local
  storage:
    postgres:
      host: postgresql.psql-system.svc.cluster.local

secret:
  storage:
    key: STORAGE_PASSWORD
    value: authelia
    filename: STORAGE_PASSWORD
  redis:
    key: REDIS_PASSWORD
    value: authelia
    filename: REDIS_PASSWORD
EOF
)

#
kubectl get all -n authelia-system
```

### Status

```sh
kubectl rollout status daemonset/authelia \
  -n authelia-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=authelia' \
  -n authelia-system \
  -f
```

### Delete

```sh
helm uninstall authelia \
  -n authelia-system

kubectl delete ns authelia-system \
  --grace-period=0 \
  --force
```
