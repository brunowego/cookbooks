# Apache Kafka

<!--
https://medium.com/@sannidhi.s.t/dead-letter-queues-dlqs-in-kafka-afb4b6835309

https://app.pluralsight.com/library/courses/securing-kafka-cluster/table-of-contents

https://www.youtube.com/watch?v=sCkAe-Umb0o

https://www.blazemeter.com/blog/apache-kafka-how-to-load-test-with-jmeter
https://octoperf.com/blog/2020/10/30/kafka-load-testing/
https://github.com/corunet/kloadgen

https://linkedin.com/learning/apache-kafka-essential-training-building-scalable-applications/why-are-kafka-skills-so-high-in-demand

https://linkedin.com/learning/apache-kafka-essential-training-getting-started/getting-started-with-apache-kafka

https://app.pluralsight.com/library/courses/securing-kafka-cluster/table-of-contents

https://linkedin.com/learning/search?entityType=COURSE&keywords=kafka

https://app.pluralsight.com/library/courses/apache-kafka-getting-started/table-of-contents

https://app.pluralsight.com/library/courses/spark-kafka-cassandra-applying-lambda-architecture/table-of-contents

https://app.pluralsight.com/library/courses/building-enterprise-distributed-online-analytics-platform/table-of-contents

https://app.pluralsight.com/paths/skills/handling-streaming-data-with-messaging-systems

https://app.pluralsight.com/library/courses/designing-event-driven-applications-apache-kafka-ecosystem/table-of-contents
https://app.pluralsight.com/library/courses/kafka-build-deploy-monitor-real-world-application/table-of-contents

https://app.pluralsight.com/library/courses/processing-streaming-data-apache-spark-structured-streaming/table-of-contents
https://app.pluralsight.com/library/courses/spring-integration-channel-adapters-external-systems/table-of-contents
https://app.pluralsight.com/library/courses/storing-managing-data-redis-apache-kafka-heroku/table-of-contents
https://app.pluralsight.com/library/courses/implementing-event-log-kafka/table-of-contents
https://app.pluralsight.com/library/courses/enforcing-data-contracts-kafka-schema-registry/table-of-contents
https://app.pluralsight.com/library/courses/deploying-kafka-cluster/table-of-contents

How do Kafka ACLs works? https://www.youtube.com/watch?v=4pj6Ewaf7N8

https://medium.com/@sathishjayaram/batch-processing-of-multi-partitioned-kafka-topics-using-spark-with-example-b686676d33f1
https://www.slideshare.net/KaiWaehner/apache-kafka-open-source-ecosystem-for-machine-learning-at-extreme-scale-apachecon-montreal-sept-2018
https://www.confluent.io/blog/using-apache-kafka-drive-cutting-edge-machine-learning
https://www.confluent.io/blog/build-deploy-scalable-machine-learning-production-apache-kafka/
https://medium.com/@stephane.maarek/how-to-use-apache-kafka-to-transform-a-batch-pipeline-into-a-real-time-one-831b48a6ad85
https://github.com/kaiwaehner/kafka-streams-machine-learning-examples

streaming.payments.legit
streaming.payments.fraud
streaming.payments.error
queuing.payments
-->

## References

- [Kafka Listeners - Explained](https://rmoff.net/2018/08/02/kafka-listeners-explained/)

## Videos

- [System Design: Why is Kafka fast?](https://youtube.com/watch?v=UNUz1-msbOM)

## Tools

- [Kafka Manager](/kafka/kafka-manager.md)

## Helm

### References

- [Helm Chart](https://github.com/bitnami/charts/tree/master/bitnami/kafka)

### Repository

```sh
helm repo add bitnami 'https://charts.bitnami.com/bitnami'
helm repo update
```

### Install

```sh
kubectl create ns kafka
```

```sh
helm install kafka bitnami/kafka \
  --namespace kafka \
  --version 14.1.0
```

### Status

```sh
kubectl rollout status statefulset kafka \
  -n kafka
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=kafka' \
  -n kafka \
  -f
```

### DNS

```sh
dig @10.96.0.10 kafka.kafka.svc.cluster.local +short
nslookup kafka.kafka.svc.cluster.local 10.96.0.10
```

### Delete

```sh
helm uninstall kafka \
  -n kafka

kubectl delete ns kafka \
  --grace-period=0 \
  --force
```

## Docker

### Dependencies

- [kafkacat](/kafkacat.md)

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
  -e KAFKA_JMX_OPTS='-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Djava.rmi.server.hostname=127.0.0.1 -Dcom.sun.management.jmxremote.rmi.port=1099' \
  -e JMX_PORT='1099' \
  -v kafka-data:/var/lib/kafka/data \
  -v kafka-logs:/kafka \
  -p 9092:9092 \
  -p 1099:1099 \
  --name kafka \
  --network workbench \
  docker.io/wurstmeister/kafka:2.12-2.4.1
```

```sh
# Kafka test with GNU Netcat
nc -vzw 5 127.0.0.1 9092 < /dev/null

# Kafka test with Kafkacat
kafkacat -Lb 127.0.0.1:9092

sudo hostess add kafka 127.0.0.1

kafkacat \
  -Cb 127.0.0.1:9092 \
  -t example

# Or, with kafka-console-consumer script
# docker exec kafka kafka-console-consumer.sh \
#   --bootstrap-server 'kafka:9092' \
#   --from-beginning \
#   --topic 'example'

# JMX test
jconsole 127.0.0.1:1099
```

### State

```sh
#
docker stop \
  kafka-zookeeper \
  kafka

#
docker start \
  kafka-zookeeper \
  kafka
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
