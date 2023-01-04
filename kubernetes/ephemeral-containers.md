# Kubernetes Ephemeral Containers

<!--
https://github.com/GoogleContainerTools/distroless/issues/999
-->

## Demonstration

### Sample Resource

```sh
#
kubens 'default'

#
cat << EOF | kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: slim
spec:
  selector:
    matchLabels:
      app: slim
  template:
    metadata:
      labels:
        app: slim
    spec:
      containers:
        - name: app
          image: gcr.io/distroless/python3-debian11
          command:
            - python
            - -m
            - http.server
            - '8080'
EOF

#
POD_NAME=$(kubectl get pods -l app=slim -o jsonpath='{.items[0].metadata.name}')

# limited shell
kubectl exec -it -c app "$POD_NAME" -- /bin/sh
```

### Ephemeral Container

```sh
#
kubectl debug \
  --attach=false \
  -c debugger \
  --image docker.io/library/busybox:stable \
  -it \
  "$POD_NAME"

#
kubectl get pod "$POD_NAME" -o jsonpath='{.spec.ephemeralContainers}' | jq
kubectl get pod "$POD_NAME" -o jsonpath='{.status.ephemeralContainerStatuses}' | jq

#
kubectl attach -it -c debugger "$POD_NAME"
```

#### Shared Namespace

```sh
#
kubectl patch deployment slim --patch '{"spec": {"template": {"spec": {"shareProcessNamespace": true}}}}'

#
POD_NAME=$(kubectl get pods -l app=slim -o jsonpath='{.items[0].metadata.name}')

#
kubectl debug \
  --attach=false \
  -c debugger \
  --image docker.io/library/busybox:stable \
  --share-processes \
  -it \
  "$POD_NAME"

#
kubectl attach -it -c debugger "$POD_NAME"
```

### Testing

```sh
netstat -tulpn

wget -O - 127.0.0.1:8080

ps auxf
```
