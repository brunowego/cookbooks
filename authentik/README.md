# authentik

## Links

- [Code Repository](https://github.com/goauthentik/authentik)
- [Main Website](https://goauthentik.io)
- [Docs](https://goauthentik.io/docs/)

## Helm

### References

- [Values](https://github.com/goauthentik/helm/tree/main/charts/authentik#values)

### Repository

```sh
helm repo add authentik 'https://charts.goauthentik.io'
helm repo update
```

### Install

```sh
#
kubectl create ns authentik-system
# kubectl create ns sso

#
helm search repo -l authentik/authentik

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install authentik authentik/authentik \
  --namespace authentik-system \
  --version 2022.11.3 \
  -f <(cat << EOF
authentik:
  error_reporting:
    enabled: true
  postgresql:
    password: authentik
  secret_key: $(head -c 12 /dev/urandom | shasum | cut -d ' ' -f 1)

ingress:
  enabled: true
  hosts:
    - host: authentik.${K8S_DOMAIN}
      paths:
        - path: /
          pathType: Prefix

postgresql:
  enabled: true
  postgresqlPassword: authentik

redis:
  enabled: true
EOF
)

#
kubectl get all -n authentik-system
```

### Status

```sh
kubectl rollout status deployment/authentik-server \
  -n authentik-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/component=server,app.kubernetes.io/instance=authentik,app.kubernetes.io/name=authentik' \
  -n authentik-system \
  -f
```

### Initial Setup

```sh
echo -e "[INFO]\thttp://authentik.$DOMAIN/if/flow/initial-setup/"
```

### Dump Config

```sh
kubectl exec -it \
  deployment/authentik-worker \
  -c authentik \
  -n authentik-system \
    -- ak dump_config
```

### Delete

```sh
helm uninstall authentik \
  -n authentik-system

kubectl delete ns authentik-system \
  --grace-period=0 \
  --force
```
