# Custom Resource (CR)

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
          imagePullPolicy: IfNotPresent
          # imagePullPolicy: Always
```

## Image Pull Secrets

```yaml
# ...
spec:
  # ..
  template:
    # ...
    spec:
      # ...
      imagePullSecrets:
        - name: my-org-docker-registry
```

## Rolling Strategy

### StatefulSet

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

```sh
kubectl rollout restart statefulset <name>
```

### Deployment

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
      # maxSurge: 50%
      # maxUnavailable: 20%
```

```sh
kubectl rollout restart deployment <name>
```

### DaemonSet

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

```sh
kubectl rollout restart daemonset <name>
```

## Startup Probes

**Docs:** [Configure Liveness, Readiness and Startup Probes](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/)

```yaml
# ...
spec:
  # ..
  template:
    # ...
    spec:
      containers:
      - # ...
        livenessProbe:
          exec:
            command:
            - cat
            - /tmp/healthy
          initialDelaySeconds: 5
          periodSeconds: 5

# ...
spec:
  # ..
  template:
    # ...
    spec:
      containers:
      - # ...
        livenessProbe:
          httpGet:
            path: /healthz
            port: 8080
            httpHeaders:
            - name: Custom-Header
              value: Awesome
          initialDelaySeconds: 3
          periodSeconds: 3

# ...
spec:
  # ..
  template:
    # ...
    spec:
      containers:
      - # ...
        readinessProbe:
          tcpSocket:
            port: 8080
          initialDelaySeconds: 5
          periodSeconds: 10
        livenessProbe:
          tcpSocket:
            port: 8080
          initialDelaySeconds: 15
          periodSeconds: 20
```
