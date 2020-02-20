# Kafka Manager

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/kafka-manager#configuration)

### Dependencies

- [Apache Kafka](/apache_kafka.md#helm)

### Install

```sh
helm install stable/kafka-manager \
  -n kafka-manager \
  --namespace kafka \
  --set basicAuth.enabled=true \
  --set basicAuth.password="$(head -c 12 /dev/urandom | shasum | cut -d ' ' -f 1)" \
  --set ingress.enabled=true \
  --set ingress.hosts={kafka-manager.$(minikube ip).nip.io}
```

### Delete

```sh
helm delete kafka-manager --purge
```

## Docker

### Dependencies

- [Apache Kafka](/apache_kafka.md#docker)

### Running

```sh
docker run -d \
  -h kafka-manager \
  -e ZK_HOSTS=kafka-zookeeper:2181 \
  -e APPLICATION_SECRET='Pa$$w0rd!' \
  -e KAFKA_MANAGER_AUTH_ENABLED='true' \
  -e KAFKA_MANAGER_USERNAME='admin' \
  -e KAFKA_MANAGER_PASSWORD='admin' \
  -p 9000:9000 \
  --name kafka-manager \
  docker.io/hlebalbau/kafka-manager:latest
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:9000'
```

### Configuration

1. Cluster
2. Add Cluster
3. Cluster Name: Example
4. Cluster Zookeeper Hosts: kafka-zookeeper:2181
5. Kafka Version: 2.2.0
6. Save

### Remove

```sh
docker rm -f kafka-manager
```
