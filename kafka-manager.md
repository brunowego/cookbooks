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
  $(echo "$DOCKER_RUN_OPTS") \
  -h kafka-manager \
  -e ZK_HOSTS='kafka-zookeeper:2181' \
  -e APPLICATION_SECRET='Pa$$w0rd!' \
  -v kafka-manager-conf:/kafka-manager/conf \
  -p 9000:9000 \
  --name kafka-manager \
  --network workbench \
  docker.io/hlebalbau/kafka-manager:3.0.0.4 -Dpidfile.path=/dev/null
```

> Wait! This process take a while.

```sh
docker logs -f kafka-manager | sed '/Application started (Prod)/ q'
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:9000'
```

### Configuration

1. Cluster
2. Add Cluster
   - Cluster Name: `Example`
   - Cluster Zookeeper Hosts: `kafka-zookeeper:2181`
   - Kafka Version:`2.4.0`
   - Check: Enable JMX Polling (Set JMX_PORT env variable before starting kafka server)
   - Check: Poll consumer information (Not recommended for large # of consumers if ZK is used for offsets tracking on older Kafka versions)
   - Save

Run [usage test](/kafkacat.md#usage).

### Remove

```sh
docker rm -f kafka-manager

docker volume rm kafka-manager-conf
```
