# SigNoz

**Keywords:** Observability, APM, OpenTelemetry Native

## Links

- [Code Repository](https://github.com/SigNoz/signoz)
- [Main Website](https://signoz.io)
- [Docs](https://signoz.io/docs)
  - [Deploying with Helm directly](https://signoz.io/docs/install/kubernetes/others/)

## Related

- [OpenTelemetry Collector](/opentelemetry/collector.md)

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
# kubectl create ns observability

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
    # annotations:
    #   cert-manager.io/cluster-issuer: letsencrypt-issuer
    hosts:
      - host: signoz.${K8S_DOMAIN}
        paths:
          - path: /
            pathType: ImplementationSpecific
            port: 3301
    # tls:
    #   - secretName: signoz.tls-secret
    #     hosts:
    #       - signoz.${K8S_DOMAIN}
EOF
)
```

<!--
# gRPC
kubectl port-forward \
  --address 0.0.0.0 \
  svc/signoz-otel-collector \
  4317:4317

# HTTP
kubectl port-forward \
  --address 0.0.0.0 \
  svc/signoz-otel-collector \
  4318:4318
-->

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
