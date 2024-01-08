# Neon

**Keywords:** Serverless PostgreSQL, Fault-Tolerant, Branchable Postgres

## Links

- [Code Repository](https://github.com/neondatabase/neon)
- [Main Website](https://neon.tech)

<!--
https://github.com/neondatabase/preview-branches-with-vercel
-->

<!-- psql -h pg.neon.tech -->

<!--
pageserver

neondatabase/neon
-->

## Helm

### References

- [Values](https://github.com/neondatabase/helm-charts/tree/main/charts/neon-proxy#values)

<!--
https://github.com/neondatabase/helm-charts/tree/main/charts/neon-pg-sni-router
https://github.com/neondatabase/helm-charts/tree/main/charts/neon-storage-broker
-->

### Repository

```sh
helm repo add neondatabase 'https://neondatabase.github.io/helm-charts'
helm repo update
```

### Install

```sh
#
kubectl create ns neon
# kubectl create ns database

#
kubens neon

#
helm search repo -l neondatabase/neon-proxy

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install neon-proxy neondatabase/neon-proxy \
  --version 1.7.1 \
  -f <(cat << EOF
# TODO
EOF
)
```

<!--
kubectl port-forward \
  --address 0.0.0.0 \
  svc/monitoring-neon-proxy \
  8080:80
-->

### Status

```sh
kubectl rollout status deploy/neon-proxy
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=neon-proxy' \
  -f
```

### Delete

```sh
helm uninstall neon-proxy

kubectl delete ns neon-proxy \
  --grace-period=0 \
  --force
```
