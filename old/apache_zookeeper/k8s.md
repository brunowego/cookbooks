# Kubernetes

## Running

```sh
cat << EOF | kubectl apply -f -
---
apiVersion: v1
kind: Pod
metadata:
  name: example-zookeeper
  labels:
    app: example
    service: zookeeper
spec:
  containers:
    - name: zookeeper
      image: wurstmeister/zookeeper
      ports:
        - containerPort: 2181
      livenessProbe:
        tcpSocket:
          port: 2181
        initialDelaySeconds: 60
        periodSeconds: 20
---
apiVersion: v1
kind: Service
metadata:
  name: example-zookeeper
  labels:
    app: example
    service: zookeeper
spec:
  type: ClusterIP
  ports:
    - port: 2181
      targetPort: 2181
  selector:
    app: example
    service: zookeeper

EOF
```
