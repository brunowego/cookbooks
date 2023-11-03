# OpenSearch Dashboards

## Links

- [Code Repository](https://github.com/opensearch-project/OpenSearch-Dashboards)
- [Main Website](https://opensearch.org/docs/latest/dashboards/index/)

## Helm

### Dependencies

- [OpenSearch](./README.md#helm)

### References

- [Configuration](https://github.com/opensearch-project/helm-charts/tree/main/charts/opensearch-dashboards#configuration)

### Install

```sh
#
kubens opensearch

#
helm search repo -l opensearch/opensearch-dashboards

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install opensearch-dashboards opensearch/opensearch-dashboards \
  --version 2.7.0 \
  -f <(cat << EOF
ingress:
  enabled: true
  ingressClassName: nginx

  hosts:
    - host: opensearch.${K8S_DOMAIN}
      paths:
        - path: /
          backend:
            serviceName: opensearch-dashboards
            servicePort: 5601
EOF
)

#
kubectl get all
```

### Status

```sh
kubectl rollout status deploy/opensearch-dashboards
```

### Logs

```sh
kubectl logs \
  -l 'app=opensearch-dashboards' \
  -f
```

### Credentials

| Username | Password |
| -------- | -------- |
| `admin`  | `admin`  |

### Delete

```sh
helm uninstall opensearch-dashboards
```
