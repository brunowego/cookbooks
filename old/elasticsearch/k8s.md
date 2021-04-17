# Kubernetes

```sh
cat << EOF | kubectl apply -f -
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: es-config-node
data:
  elasticsearch.yml: |
    cluster.name: docker-cluster
    network.host: "0.0.0.0"
    bootstrap.memory_lock: false
    discovery.zen.ping.unicast.hosts: ["es-node-0.elasticsearch.default.svc.cluster.local","es-node-1.elasticsearch.default.svc.cluster.local","es-node-2.elasticsearch.default.svc.cluster.local"]
    discovery.zen.ping.unicast.hosts.resolve_timeout: 20s
    xpack.security.enabled: false
    xpack.monitoring.enabled: false
EOF
```

```sh
sudo install -dm 777 -o nfsnobody -g nfsnobody /var/data/elasticsearch
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
      name: es-pv
      labels:
        type: local
    spec:
      storageClassName: sc-local
      capacity:
        storage: 30Gi
      accessModes:
        - ReadWriteOnce
      hostPath:
        path: /var/data/elasticsearch
  - apiVersion: v1
    kind: PersistentVolume
    metadata:
      name: es-pv1
      labels:
        type: local
    spec:
      storageClassName: sc-local
      capacity:
        storage: 30Gi
      accessModes:
        - ReadWriteOnce
      hostPath:
        path: /var/data/elasticsearch
  - apiVersion: v1
    kind: PersistentVolume
    metadata:
      name: es-pv2
      labels:
        type: local
    spec:
      storageClassName: sc-local
      capacity:
        storage: 30Gi
      accessModes:
        - ReadWriteOnce
      hostPath:
        path: /var/data/elasticsearch
EOF
```

```sh
cat << EOF | kubectl apply -f -
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: es-node
  labels:
    component: elasticsearch
    role: node
spec:
  selector:
    matchLabels:
      component: elasticsearch
      role: node
  serviceName: elasticsearch
  replicas: 3
  template:
    metadata:
      labels:
        component: elasticsearch
        role: node
    spec:
      initContainers:
        - name: init-sysctl
          image: busybox:1.27.2
          command:
            - sysctl
            - -w
            - vm.max_map_count=262144
          env:
            - name: ES_JAVA_OPTS
              value: -Xms1g -Xmx1g
            - name: bootstrap.memory_lock
              value: "true"
          securityContext:
            privileged: true
      containers:
        - name: es-node
          image: elasticsearch:6.6.1
          env:
            - name: NAMESPACE
              valueFrom:
                fieldRef:
                  fieldPath: metadata.namespace
            - name: NODE_NAME
              valueFrom:
                fieldRef:
                  fieldPath: metadata.name
          ports:
            - containerPort: 9300
              name: transport
            - containerPort: 9200
              name: http
          volumeMounts:
            - mountPath: /data
              name: storage
            - name: elasticsearch-yml
              mountPath: /usr/share/elasticsearch/config/elasticsearch.yml
              subPath: elasticsearch.yml
      volumes:
        - name: elasticsearch-yml
          configMap:
            name: es-config-node
            items:
              - key: elasticsearch.yml
                path: elasticsearch.yml
  volumeClaimTemplates:
    - metadata:
        name: storage
        labels:
          name: storage
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
  name: elasticsearch
  labels:
    component: elasticsearch
spec:
  type: NodePort
  selector:
    component: elasticsearch
  ports:
    - name: http
      port: 9200
      protocol: TCP
      nodePort: 30001
    - name: transport
      port: 9300
      protocol: TCP
      nodePort: 30002
  sessionAffinity: ClientIP
EOF
```
