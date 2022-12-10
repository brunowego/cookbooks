# Kubernetes Resource Quotas

## Guides

- [Resource Quotas](https://kubernetes.io/docs/concepts/policy/resource-quotas/)

## CLI

### Usage

```sh
#
kubectl describe quota -A

#
kubectl describe resourcequotas -A
```

### Custom Resource (CR)

```yaml
---
apiVersion: v1
kind: ResourceQuota
metadata:
  name: demo
spec:
  hard:
    requests:
      cpu: 100m
      memory: 128Mi
    limits:
      cpu: 150m
      memory: 256Mi
```
