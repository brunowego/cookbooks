# Apache Kafka

<!--
https://medium.com/@sathishjayaram/batch-processing-of-multi-partitioned-kafka-topics-using-spark-with-example-b686676d33f1
https://www.slideshare.net/KaiWaehner/apache-kafka-open-source-ecosystem-for-machine-learning-at-extreme-scale-apachecon-montreal-sept-2018
https://www.confluent.io/blog/using-apache-kafka-drive-cutting-edge-machine-learning
https://www.confluent.io/blog/build-deploy-scalable-machine-learning-production-apache-kafka/
https://medium.com/@stephane.maarek/how-to-use-apache-kafka-to-transform-a-batch-pipeline-into-a-real-time-one-831b48a6ad85
https://github.com/kaiwaehner/kafka-streams-machine-learning-examples
-->

## References

- [Kafka Listeners - Explained](https://rmoff.net/2018/08/02/kafka-listeners-explained/)

##

- [Kafka Manager](/kafka-manager.md)

## Helm

### References

- [Installing the Chart](https://github.com/helm/charts/tree/master/incubator/kafka#installing-the-chart)

### Repository

```sh
helm repo add incubator http://storage.googleapis.com/kubernetes-charts-incubator
helm repo update incubator
```

### Install

```sh
kubectl create namespace kafka
```

```sh
helm install incubator/kafka \
  -n kafka \
  --namespace kafka \
  --set external.enabled=true \
  --set external.type=ClusterIP
```

### NGINX Ingress

```sh
# Helm
helm upgrade nginx-ingress stable/nginx-ingress -f <(yq w <(helm get values nginx-ingress) tcp.9092 kafka/kafka:9092)

## Delete
# TODO

# Minikube
kubectl patch configmap tcp-services \
  -p '{"data":{"9092":"kafka/kafka:9092"}}' \
  -n kube-system

kubectl patch deployment nginx-ingress-controller \
  --type 'json' \
  -p '[{"op": "add", "path": "/spec/template/spec/containers/0/ports", "value": [{"hostPort": 9092, "containerPort": 9092}]}]' \
  -n kube-system

## Delete
kubectl patch configmap tcp-services \
  --type 'json' \
  -p '[{"op": "remove", "path": "/data/9092"}]' \
  -n kube-system

kubectl patch deployment nginx-ingress-controller \
  --type 'json' \
  -p '[{"op": "remove", "path": "/spec/template/spec/containers/0/ports", "value": [{"hostPort": 9092, "containerPort": 9092}]}]' \
  -n kube-system
```

### Status

```sh
kubectl rollout status statefulset kafka-zookeeper -n kafka
```

### Logs

```sh
kubectl logs -l 'app.kubernetes.io/name=kafka' -n kafka -f
```

### DNS

```sh
dig @10.96.0.10 kafka.kafka.svc.cluster.local +short
nslookup kafka.kafka.svc.cluster.local 10.96.0.10
```

### Delete

```sh
helm delete kafka --purge
kubectl delete namespace kafka --grace-period=0 --force
```

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h zookeeper \
  -v kafka-zookeeper-data:/data \
  -v kafka-zookeeper-datalog:/datalog \
  -v kafka-zookeeper-logs:/logs \
  --name kafka-zookeeper \
  --network workbench \
  docker.io/library/zookeeper:3.5.6
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h kafka \
  -e KAFKA_PORT='9092' \
  -e KAFKA_LISTENERS='PLAINTEXT://kafka:9092' \
  -e KAFKA_ZOOKEEPER_CONNECT='kafka-zookeeper:2181' \
  -e KAFKA_CREATE_TOPICS='example:4:1' \
  -v kafka-data:/var/lib/kafka/data \
  -v kafka-logs:/kafka \
  -p 9092:9092 \
  --name kafka \
  --network workbench \
  docker.io/wurstmeister/kafka:2.12-2.4.1
```

```sh
# Test
watch kafkacat -Lb 127.0.0.1:9092
```

### Remove

```sh
docker rm -f \
  kafka-zookeeper \
  kafka

docker volume rm \
  kafka-zookeeper-data \
  kafka-zookeeper-datalog \
  kafka-zookeeper-logs \
  kafka-data \
  kafka-logs
```
