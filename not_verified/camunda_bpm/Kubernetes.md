# Kubernetes

```sh
cat << EOF | kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: camunda-deployment
  labels:
    app: camunda
spec:
  selector:
    matchLabels:
      app: camunda
  replicas: 2
  template:
    metadata:
      labels:
        app: camunda
    spec:
      containers:
        - name: bpm
          image: camunda/camunda-bpm-platform
          ports:
            - containerPort: 8080
EOF
```

```sh
sudo install -dm 777 -o nfsnobody -g nobonfsnobodydy /var/data/camunda
```

```sh
cat << EOF | kubectl apply -f -
kind: PersistentVolume
apiVersion: v1
metadata:
  name: camunda-pv
  labels:
    type: local
spec:
  storageClassName: sc-local
  capacity:
    storage: 20Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: /var/data/camunda
EOF
```

```sh
cat << EOF | kubectl apply -f -
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: camunda-pvc
spec:
  storageClassName: sc-local
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 20Gi
  volumeName: camunda-pv
EOF
```

```sh
cat << EOF | kubectl apply -f -
---
apiVersion: v1
kind: Service
metadata:
  name: camunda-service
  labels:
    app: camunda
spec:
  type: NodePort
  selector:
    app: camunda
  ports:
    - name: bpm
      port: 8080
      protocol: TCP
      nodePort: 30020
  sessionAffinity: ClientIP
EOF
```

```sh
kubectl port-forward svc/camunda-service --address 0.0.0.0 8080:8080 > /dev/null &
```
