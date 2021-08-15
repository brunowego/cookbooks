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

## Run As Root

```yaml
# ...
spec:
  # ...
  template:
    # ...
    spec:
      # ...
      securityContext:
        runAsUser: 0
        # runAsNonRoot: true
```

## Image Pull Policy

```yaml
# ...
spec:
  # ..
  template:
    # ...
    spec:
      containers:
      - # ...
        imagePullPolicy: Always
        # imagePullPolicy: IfNotPresent
```

## Rolling Strategy

```yaml
# ...
kind: StatefulSet
# ...
spec:
  # ...
  replicas: 3
  updateStrategy:
    type: RollingUpdate
    # rollingUpdate:
    #   partition: 0
```

```yaml
# ...
kind: Deployment
# ...
spec:
  # ..
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 1
```

```yaml
# ...
kind: DaemonSet
# ...
spec:
  # ..
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxUnavailable: 1
```
