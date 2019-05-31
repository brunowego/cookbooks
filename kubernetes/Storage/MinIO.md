# MinIO

```sh
cat << EOF | kubectl apply -f -
---
apiVersion: v1
kind: Service
metadata:
  name: minio
  labels:
    app: minio
spec:
  clusterIP: None
  ports:
    - port: 9000
      name: minio
  selector:
    app: minio
EOF
```

```sh
cat << EOF | kubectl apply -f -
---
apiVersion: v1
kind: List
items:
  - apiVersion: v1
    kind: PersistentVolume
    metadata:
      name: minio-pv
      labels:
        type: local
    spec:
      storageClassName: sc-local
      capacity:
        storage: 30Gi
      accessModes:
        - ReadWriteOnce
      hostPath:
        path: /var/data/minio
  - apiVersion: v1
    kind: PersistentVolume
    metadata:
      name: minio-pv0
      labels:
        type: local
    spec:
      storageClassName: sc-local
      capacity:
        storage: 30Gi
      accessModes:
        - ReadWriteOnce
      hostPath:
        path: /var/data/minio
  - apiVersion: v1
    kind: PersistentVolume
    metadata:
      name: minio-pv1
      labels:
        type: local
    spec:
      storageClassName: sc-local
      capacity:
        storage: 30Gi
      accessModes:
        - ReadWriteOnce
      hostPath:
        path: /var/data/minio
  - apiVersion: v1
    kind: PersistentVolume
    metadata:
      name: minio-pv2
      labels:
        type: local
    spec:
      storageClassName: sc-local
      capacity:
        storage: 30Gi
      accessModes:
        - ReadWriteOnce
      hostPath:
        path: /var/data/minio
EOF
```

```sh
cat << EOF | kubectl apply -f -
apiVersion: apps/v1beta1
kind: StatefulSet
metadata:
  # This name uniquely identifies the StatefulSet
  name: minio
spec:
  serviceName: minio
  replicas: 4
  selector:
    matchLabels:
      app: minio # has to match .spec.template.metadata.labels
  template:
    metadata:
      labels:
        app: minio # has to match .spec.selector.matchLabels
    spec:
      containers:
        - name: minio
          env:
            - name: MINIO_ACCESS_KEY
              value: "minio"
            - name: MINIO_SECRET_KEY
              value: "minio123"
          image: minio/minio
          args:
            - server
            - http://minio-{0...3}.minio.default.svc.cluster.local/data
          ports:
            - containerPort: 9000
          # These volume mounts are persistent. Each pod in the PetSet
          # gets a volume mounted based on this field.
          volumeMounts:
            - name: data
              mountPath: /data
  # These are converted to volume claims by the controller
  # and mounted at the paths mentioned above.
  volumeClaimTemplates:
    - metadata:
        name: data
        labels:
          name: data
      spec:
        accessModes:
          - ReadWriteOnce
        storageClassName: sc-local
        resources:
          requests:
            storage: 30Gi
EOF
```

```sh
cat << EOF | kubectl apply -f -
---
apiVersion: v1
kind: Service
metadata:
  name: minio-service
spec:
  type: NodePort
  ports:
    - port: 9000
      nodePort: 30005
      targetPort: 9000
      protocol: TCP
  selector:
    app: minio
  sessionAffinity: ClientIP
EOF
```
