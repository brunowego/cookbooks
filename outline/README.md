# Outline

<!--
https://github.com/outline/outline/issues/1881

https://github.com/encircle360-oss/outline-helm-chart
-->

## Links

- [Code Repository](https://github.com/outline/outline)
- [Main Website](https://getoutline.com)
- [Download](https://getoutline.com/download)

## Helm

### Dependencies

- OpenID Connect (OIDC)
  [Dex IdP](/dex/README.md)

### References

- [Chart Repository](https://github.com/truecharts/charts/tree/master/charts/stable/outline)

### Repository

```sh
helm repo add truecharts 'https://charts.truecharts.org'
helm repo update
```

### Install

```sh
#
kubectl create ns outline
# kubectl create ns docs

#
kubens outline

#
helm search repo -l truecharts/outline

#
helm show values truecharts/outline \
  --version 7.0.12

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
export GOOGLE_CLIENT_ID='<google-client-id>'
export GOOGLE_CLIENT_SECRET='<google-client-secret>'

#
helm upgrade outline truecharts/outline \
  --version 7.0.12 \
  --set workload.main.podSpec.containers.main.env.URL="http://outline.${DOMAIN}" \
  --set workload.main.podSpec.containers.main.env.GOOGLE_CLIENT_ID="$GOOGLE_CLIENT_ID" \
  --set workload.main.podSpec.containers.main.env.GOOGLE_CLIENT_SECRET="$GOOGLE_CLIENT_SECRET" \
  --set workload.main.podSpec.containers.main.env.PDF_EXPORT_ENABLED=true
```

<!--
kubectl port-forward \
  --address 0.0.0.0 \
  svc/outline \
  10196:10196
-->

### Ingress

```sh
#
cat << EOF | kubectl apply -f -
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: outline
  namespace: outline
spec:
  rules:
  - host: outline.${DOMAIN}
    http:
      paths:
      - backend:
          service:
            name: outline
            port:
              number: 10196
        path: /
        pathType: Prefix
EOF
```

### Status

```sh
kubectl rollout status deploy/outline
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=outline' \
  -f
```

### Delete

```sh
helm uninstall outline

kubectl delete ns outline \
  --grace-period=0 \
  --force
```
