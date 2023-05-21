# Airbyte

**Keywords:** ETL, Data Integration Platform

## Links

- [Code Repository](https://github.com/airbytehq/airbyte)
- [Main Website](https://airbyte.io)
- [Docs](https://docs.airbyte.com)
  - [Integrations](https://docs.airbyte.com/integrations)

## Helm

### Repository

```sh
helm repo add airbyte-oss 'https://airbytehq.github.io/helm-charts'
helm repo update
```

### Install

```sh
#
kubectl create ns airbyte
# kubectl create ns etl

#
kubens airbyte

#
helm search repo -l airbyte-oss/airbyte

#
helm show values airbyte-oss/airbyte \
  --version 0.45.20

#
helm install airbyte airbyte-oss/airbyte \
  --version 0.45.20
```

<!--
kubectl port-forward \
  --address 127.0.0.1 \
  svc/airbyte-airbyte-webapp-svc \
  8080:80
-->

### Ingress

```sh
#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
cat << EOF | kubectl apply -f -
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: airbyte
  namespace: airbyte
spec:
  rules:
  - host: airbyte.${DOMAIN}
    http:
      paths:
      - backend:
          service:
            name: airbyte-airbyte-webapp-svc
            port:
              number: 80
        path: /
        pathType: Prefix
EOF
```

### Status

```sh
kubectl rollout status deploy/airbyte-webapp
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=webapp' \
  -f
```

### Delete

```sh
helm uninstall airbyte

kubectl delete ns airbyte \
  --grace-period=0 \
  --force
```
