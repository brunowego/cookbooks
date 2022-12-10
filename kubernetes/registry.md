# Kubernetes Registry

https://github.com/kameshsampath/minikube-helpers/blob/master/cache/minikube-cache-images.sh
https://github.com/kameshsampath/minikube-helpers

## Registry Aliases

```sh
cat << EOF | kubectl apply -f -
apiVersion: v1
data:
  registryAliases: >-
    example.com
  registrySvc: registry.kube-system.svc.cluster.local
kind: ConfigMap
metadata:
  name: registry-aliases
  namespace: kube-system
EOF
```

```sh
cat << \EOF | kubectl apply -f -
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: registry-aliases-hosts-update
  namespace: kube-system
spec:
  selector:
    matchLabels:
      app: registry-aliases-hosts-update
  template:
    metadata:
      labels:
        app: registry-aliases-hosts-update
    spec:
      initContainers:
        - name: update
          image: registry.fedoraproject.org/fedora
          volumeMounts:
            - name: etchosts
              mountPath: /host-etc/hosts
              readOnly: false
          env:
            - name: REGISTRY_ALIASES
              valueFrom:
                configMapKeyRef:
                  name: registry-aliases
                  key: registryAliases
          command:
            - bash
            - -ce
            - |
              NL=$'\n'
              TAB=$'\t'
              HOSTS="$(cat /host-etc/hosts)"
              [ -z "$REGISTRY_SERVICE_HOST" ] && echo "Failed to get hosts entry for default registry" && exit 1;
              for H in $REGISTRY_ALIASES; do
                echo "$HOSTS" | grep "$H"  || HOSTS="$HOSTS$NL$REGISTRY_SERVICE_HOST$TAB$H";
              done;
              echo "$HOSTS" | diff -u /host-etc/hosts - || echo "$HOSTS" > /host-etc/hosts
              echo "Done."
      containers:
        - name: pause-for-update
          image: gcr.io/google_containers/pause-amd64:3.1
      terminationGracePeriodSeconds: 30
      volumes:
        - name: etchosts
          hostPath:
            path: /etc/hosts
EOF
```

```sh
kubectl rollout status daemonset/registry-aliases-hosts-update -n kube-system
```

```sh
minikube ssh -- sudo cat /etc/hosts
```
