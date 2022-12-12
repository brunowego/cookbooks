# Kubernetes Resources

## Guides

- [Setting Resource Requests and Limits in Kubernetes](https://www.youtube.com/watch?v=xjpHggHKm78)

## Terms

- Kubernetes uses the "millicpu" notation, where 1,000 millicpu (or 1,000m) equals 1 CPU unit. (a.k.a millicores)
- Overcommitment State

## CLI

### Custom Resource (CR)

```yml
---
# ...
spec:
  containers:
    - # ...
      resources:
        requests:
          cpu: 200m
          memory: 32Mi
        limits:
          cpu: 250m
          memory: 64Mi
```

### Issues

#### Out Of Memory (OOMKilled)

```log
with exit code 137
```

Increase resources limits (cpu/memory).
