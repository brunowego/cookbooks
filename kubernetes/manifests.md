# Custom Resource (CR)

## Environments

```yml
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
            - name: MY_ENV1
              valueFrom:
                configMapKeyRef:
                  name: my-config-name
                  key: my-config-key
            - name: MY_ENV2
              valueFrom:
                secretKeyRef:
                  name: my-secret-name
                  key: my-secret-key
```

## Run As Root

```yml
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

```yml
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

```yml
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

```yml
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

```yml
# ...
kind: Deployment
# ...
spec:
  # ..
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 0 # can be 1, if more than one replica
      # maxSurge: 50%
      # maxUnavailable: 20%
```

```sh
kubectl rollout restart deployment <name>
```

### DaemonSet

```yml
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

### Readiness Probe

```yml
# ...
spec:
  # ..
  template:
    # ...
    spec:
      containers:
        - # ...
          readinessProbe:
            httpGet:
              path: /readyz
              port: 8080
              # httpHeaders:
              #   - name: Custom-Header
              #     value: Awesome
            # tcpSocket:
            #   port: 8080
            initialDelaySeconds: 10
            periodSeconds: 5
            timeoutSeconds: 10
            failureThreshold: 3
            successThreshold: 1
```

### Liveness Probe

```yml
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
              path: /livez
              port: 8080
              # httpHeaders:
              #   - name: Custom-Header
              #     value: Awesome
            # tcpSocket:
            #   port: 8080
            # exec:
            #   command:
            #     - cat
            #     - /tmp/healthy
            initialDelaySeconds: 10
            periodSeconds: 5
            timeoutSeconds: 10
            failureThreshold: 3
            successThreshold: 1
```
