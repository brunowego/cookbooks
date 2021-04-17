# Kubernetes

## Running

```sh
cat << EOF | kubectl apply -f -
---
apiVersion: v1
kind: Pod
metadata:
  name: example-kafka-zookeeper
  labels:
    app: example-kafka
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
  name: example-kafka-zookeeper
  labels:
    app: example-kafka
    service: zookeeper
spec:
  type: ClusterIP
  ports:
    - port: 2181
      targetPort: 2181
  selector:
    app: example-kafka
    service: zookeeper

EOF
```

```sh
cat << EOF | kubectl apply -f -
---
apiVersion: v1
kind: Pod
metadata:
  name: example-kafka-kafka
  labels:
    app: example-kafka
    service: kafka
spec:
  containers:
    - name: kafka
      image: wurstmeister/kafka
      ports:
        - containerPort: 9092
      env:
        - name: KAFKA_ADVERTISED_LISTENERS
          value: PLAINTEXT://example-kafka-kafka:9092
        - name: KAFKA_LISTENERS
          value: PLAINTEXT://0.0.0.0:9092
        - name: KAFKA_ZOOKEEPER_CONNECT
          value: example-kafka-zookeeper:2181
      livenessProbe:
        tcpSocket:
          port: 9092
        initialDelaySeconds: 60
        periodSeconds: 20
---
apiVersion: v1
kind: Service
metadata:
  name: example-kafka-kafka
  labels:
    app: example-kafka
    service: kafka
spec:
  type: ClusterIP
  ports:
    - port: 9092
      targetPort: 9092
  selector:
    app: example-kafka
    service: kafka

EOF
```
