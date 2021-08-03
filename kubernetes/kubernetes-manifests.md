# Kubernetes Manifests

## Environments

```yaml
# ...
spec:
  # ..
  template:
    # ...
    spec:
      containers:
      - # ...
        env:
        - name: KUBERNETES_NAMESPACE
          valueFrom:
            fieldRef:
              apiVersion: v1
              fieldPath: metadata.namespace
        - name: MY_ENV
          valueFrom:
            secretKeyRef:
              name: my-secret-name
              key: my-secret-key
```
