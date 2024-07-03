# Neon

<!--
https://github.com/neondatabase/preview-branches-with-vercel
-->

**Keywords:** Serverless PostgreSQL, Fault-Tolerant, Branchable Postgres

## Links

- [Code Repository](https://github.com/neondatabase/neon)
- [Main Website](https://neon.tech)
- [Console](https://console.neon.tech)
- [Status Page](https://neonstatus.com)
- [Examples](https://github.com/neondatabase/examples)

## CLI

### Links

- [Code Repository](https://github.com/neondatabase/neonctl)

### Installation

#### Homebrew

```sh
brew install neonctl
```

### Commands

```sh
neonctl -h
```

### Usage

```sh
#
neonctl auth

#
neonctl projects list
```

<!--
main
staging
develop
-->

<!-- psql -h pg.neon.tech -->

### Issues

#### TBD

```log
PostgresError: Console request failed: endpoint is temporary unavailable. check your quotas and/or contact our support
```

<!--
https://github.com/neondatabase/neon/issues/5570
-->

TODO

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
