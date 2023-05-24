# SigNoz

**Keywords:** Observability, APM, OpenTelemetry Native

## Links

- [Code Repository](https://github.com/SigNoz/signoz)
- [Main Website](https://signoz.io)
- [Docs](https://signoz.io/docs)
  - [Deploying with Helm directly](https://signoz.io/docs/install/kubernetes/others/)

## Helm

### References

- [Configuration](https://github.com/SigNoz/charts/tree/main/charts/signoz#configuration)

### Repository

```sh
helm repo add signoz 'https://charts.signoz.io'
helm repo update
```

### Install

```sh
#
kubectl create ns signoz
# kubectl create ns apm

#
kubens signoz

#
helm search repo -l signoz/signoz

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install signoz signoz/signoz \
  --version 0.15.0 \
  -f <(cat << EOF
frontend:
  ingress:
    enabled: true
    className: nginx
    hosts:
      - host: signoz.${DOMAIN}
        paths:
          - path: /
            pathType: ImplementationSpecific
            port: 3301
EOF
)
```

### Status

```sh
kubectl rollout status deploy/signoz-frontend
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/component=frontend' \
  -f
```

### Delete

```sh
helm uninstall signoz

kubectl delete ns signoz \
  --grace-period=0 \
  --force
```
