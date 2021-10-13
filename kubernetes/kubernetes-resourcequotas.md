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
      cpu: 500m
      memory: 100Mi
    limits:
      cpu: 700m
      memory: 500Mi
```
