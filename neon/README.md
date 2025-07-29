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

## Modes

- Serverless Driver (HTTP-based, using WebSockets internally) (show as http pooler)
- Traditional TCP Driver (libpq-compatible, ex: pg or postgres TCP) (show as pgbouncer)

## CLI

### Links

- [Code Repository](https://github.com/neondatabase/neonctl)

### Installation

```sh
# Using Homebrew
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
cat ~/.config/neonctl/credentials.json
#
neonctl me

#
neonctl orgs list

#
neonctl set-context --org-id <org-id>

#
neonctl projects list

#
neonctl databases list --project-id <project-id>

#
neonctl branches list --project-id <project-id>
```

<!--
neonctl roles
neonctl operations
-->

<!--
main
staging
develop
-->

<!-- psql -h pg.neon.tech -->

### Tips

#### Completion

```sh
# Neon DB neonctl
if [ -x "$(command -v neonctl)" ]; then
  source <(neonctl completion)
fi
```

### Issues

#### TBD

```log
error: remaining connection slots are reserved for roles with the SUPERUSER attribute
```

<!-- https://neon.tech/docs/connect/connection-errors -->

TODO

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
