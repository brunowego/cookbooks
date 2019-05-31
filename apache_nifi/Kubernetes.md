# Kubernetes

```sh
cat << EOF | kubectl apply -f -
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: nifi-bootstrap
data:
  run.sh: |-
    echo "Waiting to run nslookup..."
    sleep 30
    echo `nslookup nifi | sed -e 's/Address.*://' | tail -n +3` | sed -e 's/l /l\n/g' >> /tmphosts
    sed -i 's/nifi-0.nifi.default.svc.cluster.local/nifi-0.nifi.default.svc.cluster.local nifi-0/g' /tmphosts
    cat /tmphosts >> /etc/hosts
    mkdir -p /k8s/nifi
    chmod 777 /k8s/nifi
    bash /opt/nifi/start_nifi.sh
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
      name: flowfilerepository
      labels:
        type: local
    spec:
      storageClassName: local-storage
      capacity:
        storage: 5Gi
      accessModes:
        - ReadWriteOnce
      hostPath:
        path: /var/data/nifi
  - apiVersion: v1
    kind: PersistentVolume
    metadata:
      name: databaserepository
      labels:
        type: local
    spec:
      storageClassName: local-storage
      capacity:
        storage: 5Gi
      accessModes:
        - ReadWriteOnce
      hostPath:
        path: /var/data/nifi
  - apiVersion: v1
    kind: PersistentVolume
    metadata:
      name: contentrepository
      labels:
        type: local
    spec:
      storageClassName: local-storage
      capacity:
        storage: 5Gi
      accessModes:
        - ReadWriteOnce
      hostPath:
        path: /var/data/nifi
  - apiVersion: v1
    kind: PersistentVolume
    metadata:
      name: provenancerepository
      labels:
        type: local
    spec:
      storageClassName: local-storage
      capacity:
        storage: 5Gi
      accessModes:
        - ReadWriteOnce
      hostPath:
        path: /var/data/nifi
EOF
```

```sh
cat << EOF | kubectl apply -f -
---
kind: Service
apiVersion: v1
metadata:
  name: nifi-http
spec:
  type: NodePort
  sessionAffinity: ClientIP
  selector:
    app: nifi
  ports:
    - protocol: TCP
      port: 8080
      nodePort: 30015
      name: nifi
---
kind: Service
apiVersion: v1
metadata:
  name: nifi
spec:
  clusterIP: None
  selector:
    app: nifi
  ports:
    - protocol: TCP
      port: 8081
      targetPort: 8081
      name: nifi-listen-http
    - protocol: TCP
      port: 2881
      targetPort: 2881
      name: nifi-site-protocol
    - protocol: TCP
      port: 2882
      targetPort: 2882
      name: nifi-node-protocol
EOF
```

```sh
cat << EOF | kubectl apply -f -
---
apiVersion: apps/v1beta1
kind: StatefulSet
metadata:
  name: nifi
spec:
  serviceName: nifi
  replicas: 1
  podManagementPolicy: Parallel
  updateStrategy:
    type: RollingUpdate
  template:
    metadata:
      labels:
        app: nifi
    spec:
      containers:
        - name: nifi
          image: xemuliam/nifi:1.4.0
          securityContext:
            privileged: true
          command: ["/bin/sh"]
          args: ["-c", "/opt/nifi/start_nifi.sh"]
          imagePullPolicy: Always
          ports:
            - containerPort: 8080
            - containerPort: 8081
            - containerPort: 8443
            - containerPort: 2882
          volumeMounts:
            - name: flowfilerepository
              mountPath: /opt/nifi/flowfile_repository
            - name: databaserepository
              mountPath: /opt/nifi/database_repository
            - name: contentrepository
              mountPath: /opt/nifi/content_repository
            - name: provenancerepository
              mountPath: /opt/nifi/provenance_repository
          env:
            - name: ZK_NODES_LIST
              value: "zk-0.zk-hs.default.svc.cluster.local"
            - name: ZK_MONITOR_PORT
              value: "2888"
            - name: IS_CLUSTER_NODE
              value: "yes"
            - name: BANNER_TEXT
              value: "Nifi Cluster"
  volumeClaimTemplates:
    - metadata:
        name: flowfilerepository
      spec:
        accessModes: ['ReadWriteOnce']
        resources:
          requests:
            storage: 5Gi
        storageClassName: local-storage
    - metadata:
        name: databaserepository
      spec:
        accessModes: ['ReadWriteOnce"]
        resources:
          requests:
            storage: 5Gi
        storageClassName: local-storage
    - metadata:
        name: contentrepository
      spec:
        accessModes: ['ReadWriteOnce']
        resources:
          requests:
            storage: 5Gi
        storageClassName: local-storage
    - metadata:
        name: provenancerepository
      spec:
        accessModes: ['ReadWriteOnce']
        resources:
          requests:
            storage: 5Gi
        storageClassName: local-storage
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
      name: zk-pv
      labels:
        type: local
    spec:
      storageClassName: local-storage
      capacity:
        storage: 5Gi
      accessModes:
        - ReadWriteOnce
      hostPath:
        path: /var/data/zk
EOF
```

```sh
cat << EOF | kubectl apply -f -
---
apiVersion: v1
kind: Service
metadata:
  name: zk-hs
  labels:
    app: zk
spec:
  ports:
    - port: 2888
      name: server
    - port: 3888
      name: leader-election
  clusterIP: None
  selector:
    app: zk
---
apiVersion: v1
kind: Service
metadata:
  name: zk-cs
  labels:
    app: zk
spec:
  ports:
    - port: 2181
      name: client
  selector:
    app: zk
---
apiVersion: policy/v1beta1
kind: PodDisruptionBudget
metadata:
  name: zk-pdb
spec:
  selector:
    matchLabels:
      app: zk
  maxUnavailable: 1
---
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: zk
spec:
  selector:
    matchLabels:
      app: zk
  serviceName: zk-hs
  replicas: 1
  updateStrategy:
    type: RollingUpdate
  podManagementPolicy: Parallel
  template:
    metadata:
      labels:
        app: zk
    spec:
      containers:
        - name: kubernetes-zookeeper
          imagePullPolicy: Always
          image: "k8s.gcr.io/kubernetes-zookeeper:1.0-3.4.10"
          resources:
            requests:
              memory: "500Mi"
              cpu: "0.5"
          ports:
            - containerPort: 2181
              name: client
            - containerPort: 2888
              name: server
            - containerPort: 3888
              name: leader-election
          command:
            - sh
            - -c
            - "start-zookeeper \
              --servers=1 \
              --data_dir=/var/lib/zookeeper/data \
              --data_log_dir=/var/lib/zookeeper/data/log \
              --conf_dir=/opt/zookeeper/conf \
              --client_port=2181 \
              --election_port=3888 \
              --server_port=2888 \
              --tick_time=2000 \
              --init_limit=10 \
              --sync_limit=5 \
              --heap=256M \
              --max_client_cnxns=60 \
              --snap_retain_count=3 \
              --purge_interval=12 \
              --max_session_timeout=40000 \
              --min_session_timeout=4000 \
              --log_level=INFO"
          readinessProbe:
            exec:
              command:
                - sh
                - -c
                - "zookeeper-ready 2181"
            initialDelaySeconds: 10
            timeoutSeconds: 5
          livenessProbe:
            exec:
              command:
                - sh
                - -c
                - "zookeeper-ready 2181"
            initialDelaySeconds: 10
            timeoutSeconds: 5
          volumeMounts:
            - name: datadir
              mountPath: /var/lib/zookeeper
  volumeClaimTemplates:
    - metadata:
        name: datadir
      spec:
        storageClassName: local-storage
        accessModes: ['ReadWriteOnce']
        resources:
          requests:
            storage: 5Gi
EOF
```
