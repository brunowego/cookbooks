# Apache Flume

## References

- [Using Kafka with Flume](https://docs.cloudera.com/documentation/kafka/2-0-x/topics/kafka_flume.html)

## CLI

### Installation

#### Homebrew

```sh
brew install flume
```

### Issues

#### GC overhead limit exceeded

```sh
# Linux
sudo sed -ri "0,/# export JAVA_OPTS=(.*)/ s//export JAVA_OPTS=\1/" /opt/apache-flume/conf/flume-env.sh

sudo sed -i 's/-Xms100m -Xmx2000m/-Xms1g -Xmx2g/g' /opt/apache-flume/conf/flume-env.sh
```

## Docker

### Dependencies

- [Apache Kafka](/apache_kafka.md#docker)
- [Apache Hadoop](/apache_hadoop.md#docker)

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Configuration

```sh
docker run -i --rm \
  -v flume-config:/opt/flume-config \
  docker.io/library/alpine:3.9 /bin/sh << EOSHELL
cat << EOF > /opt/flume-config/log4j.properties
# Root logger option
log4j.rootLogger=INFO, stdout
log4j.logger.org.apache.flume.sink=DEBUG

# Direct log messages to stdout
log4j.appender.stdout=org.apache.log4j.ConsoleAppender
log4j.appender.stdout.Target=System.out
log4j.appender.stdout.layout=org.apache.log4j.PatternLayout
log4j.appender.stdout.layout.ConversionPattern=%d{yyyy-MM-dd HH:mm:ss} %-5p %c{1}:%L - %m%n
EOF
EOSHELL
```

### Running

#### Netcat to Logger

```sh
docker run -i --rm \
  -v flume-config:/opt/flume-config \
  docker.io/library/alpine:3.9 /bin/sh << EOSHELL
cat << EOF > /opt/flume-config/flume.conf

docker.sources = n1
docker.sinks = l1
docker.channels = m1

docker.sources.n1.channels = m1
docker.sinks.l1.channel = m1

docker.sources.n1.type = netcat
docker.sources.n1.bind = 0.0.0.0
docker.sources.n1.port = 44444

docker.sinks.l1.type = logger

docker.channels.m1.type = memory
EOF
EOSHELL
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h flume \
  -e FLUME_AGENT_NAME='docker' \
  -v flume-config:/opt/flume-config \
  -p 44444:44444 \
  --name flume \
  --network workbench \
  docker.io/probablyfine/flume:latest
```

```sh
#
docker logs -f flume

#
telnet 127.0.0.1 44444
```

#### Kafka to Hadoop DFS

```sh
docker run -i --rm \
  -v hadoop-src:/usr/src/hadoop \
  -w /usr/src/hadoop \
  docker.io/library/alpine:3.9 /bin/sh << EOSHELL
apk add -q --no-cache tar

wget -O - https://archive.apache.org/dist/hadoop/common/hadoop-2.7.4/hadoop-2.7.4.tar.gz | \
  tar --transform s/hadoop-// -xz
EOSHELL
```

```sh
#
docker exec -it hadoop-dfs-namenode hdfs dfs -ls -R /

#
docker exec -it hadoop-dfs-namenode hdfs dfs \
  -mkdir \
  -p \
  /user/flume/events

#
docker run -i --rm \
  -v flume-config:/opt/flume-config \
  docker.io/library/alpine:3.9 /bin/sh << \EOSHELL
cat << \EOF > /opt/flume-config/flume-env.sh
HADOOP_HOME="/usr/src/hadoop/2.7.4"
FLUME_CLASSPATH="$HADOOP_HOME/share/hadoop/common/hadoop-common-2.7.4.jar"
EOF

cat << EOF > /opt/flume-config/flume.conf
docker.sources = k1
docker.sinks = h1
docker.channels = m1

docker.sources.k1.channels = m1
docker.sinks.h1.channel = m1

docker.sources.k1.type = org.apache.flume.source.kafka.KafkaSource
docker.sources.k1.kafka.bootstrap.servers = kafka:9092
docker.sources.k1.kafka.topics = events

docker.sinks.h1.type = hdfs
docker.sinks.h1.hdfs.path = hdfs://hadoop-dfs-namenode:8020/user/flume/events/%Y/%m/%d

docker.channels.m1.type = memory
EOF
EOSHELL
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h flume \
  -e FLUME_AGENT_NAME='docker' \
  -v flume-config:/opt/flume-config \
  -v hadoop-src:/usr/src/hadoop \
  --name flume \
  --network workbench \
  docker.io/probablyfine/flume:latest
```

```sh
#
kafkacat -Lb 127.0.0.1:9092

#
echo hello | kafkacat \
  -Pb 127.0.0.1:9092 \
  -t events \
  -p 0

#
docker exec -it hadoop-dfs-namenode hdfs dfs -ls -R /

#
kafkacat \
  -Cb 127.0.0.1:9092 \
  -t events \
  -o earliest \
  -c 1
```

### State

```sh
#
docker stop \
  flume

#
docker start \
  flume
```

### Remove

```sh
docker rm -f \
  flume

docker volume rm \
  flume-config
```
