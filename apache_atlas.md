# Apache Atlas

<!--
https://www.oreilly.com/library/view/data-lake-for/9781787281349/
-->

## References

- [REST API](https://atlas.apache.org/api/v2/index.html)
- Domain Specific Search (DSL)

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
  -h cassandra \
  -v atlas-cassandra-data:/var/lib/cassandra \
  -p 9042:9042 \
  --name atlas-cassandra \
  --network workbench \
  docker.io/library/cassandra:3.11.10

docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h elasticsearch \
  -e discovery.type=single-node \
  -v atlas-elasticsearch-config:/usr/share/elasticsearch/config \
  -v atlas-elasticsearch-data:/usr/share/elasticsearch/data \
  -v atlas-elasticsearch-logs:/usr/share/elasticsearch/logs \
  -p 9200:9200 \
  -p 9300:9300 \
  --name atlas-elasticsearch \
  --network workbench \
  docker.io/library/elasticsearch:7.5.0

docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h zookeeper \
  -v atlas-zookeeper-data:/data \
  -v atlas-zookeeper-datalog:/datalog \
  -v atlas-zookeeper-logs:/logs \
  --name atlas-zookeeper \
  --network workbench \
  docker.io/library/zookeeper:3.5.6

docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h kafka \
  -e KAFKA_PORT='9092' \
  -e KAFKA_LISTENERS='PLAINTEXT://atlas-kafka:9092' \
  -e KAFKA_ZOOKEEPER_CONNECT='atlas-zookeeper:2181' \
  -v atlas-kafka-data:/var/lib/kafka/data \
  -v atlas-kafka-logs:/kafka \
  -p 9092:9092 \
  -p 1099:1099 \
  --name atlas-kafka \
  --network workbench \
  docker.io/wurstmeister/kafka:2.12-2.4.1

docker exec -i atlas-kafka /bin/sh << \EOSHELL
kafka-topics.sh --create --if-not-exists --zookeeper atlas-zookeeper:2181 --partitions 1 --replication-factor 1 --topic ATLAS_HOOK
kafka-topics.sh --create --if-not-exists --zookeeper atlas-zookeeper:2181 --partitions 1 --replication-factor 1 --topic ATLAS_ENTITIES
EOSHELL

docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h atlas \
  -v atlas-config:/opt/atlas/conf \
  -e ATLAS_PROVISION_EXAMPLES='true' \
  -p 21000:21000 \
  --name atlas \
  --network workbench \
  docker.io/trivadis/apache-atlas:2.1.0
```

```sh
#
docker exec -i atlas /bin/sh << \EOSHELL
sed -i '/^atlas.graph.storage.hostname=/s/=.*/=atlas-cassandra/' /opt/atlas/conf/atlas-application.properties
sed -i '/^atlas.graph.index.search.hostname=/s/=.*/=atlas-elasticsearch/' /opt/atlas/conf/atlas-application.properties
sed -i '/^atlas.kafka.zookeeper.connect=/s/=.*/=atlas-zookeeper:2181/' /opt/atlas/conf/atlas-application.properties
sed -i '/^atlas.kafka.bootstrap.servers=/s/=.*/=atlas-kafka:9092/' /opt/atlas/conf/atlas-application.properties
EOSHELL

#
docker restart atlas
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:21000'
```

| Login | Password |
| --- | --- |
| `admin` | `admin` |

### Remove

```sh
docker rm -f \
  atlas-cassandra \
  atlas-elasticsearch \
  atlas-zookeeper \
  atlas-kafka \
  atlas

docker volume rm \
  atlas-cassandra-data \
  atlas-elasticsearch-config \
  atlas-elasticsearch-data \
  atlas-elasticsearch-logs \
  atlas-zookeeper-data \
  atlas-zookeeper-datalog \
  atlas-zookeeper-logs \
  atlas-kafka-data \
  atlas-kafka-logs \
  atlas-config
```
