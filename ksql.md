# KSQL

<!--
https://www.udemy.com/course/kafka-ksql/
https://github.com/Squiggle/kafka-ksql-postgres

https://github.com/bjoernrost/mysql-ksql-etl-demo
https://speakerdeck.com/rmoff/streaming-etl-in-practice-with-postgresql-apache-kafka-and-ksql?slide=24
https://github.com/egen/ksql/blob/master/docker-compose.yml
https://github.com/JimGalasyn/JimGalasyn.github.io/blob/master/docs/installation/server-config/security.md
-->

## References

- [Tutorials](https://github.com/confluentinc/ksql/tree/master/docs-md/tutorials)
- [KSQL Examples](https://github.com/angry-tony/ksql-examples)

## Docker

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h ksql-cli \
  --name ksql-cli \
  docker.io/confluentinc/cp-ksql-cli:5.3.2 http://127.0.0.1:8088
```

## CLI

### Dependencies

- [Apache Maven](/apache_maven.md)

### Installation

#### Git

```sh
git clone https://github.com/confluentinc/ksql.git ksql && cd "$_"
```

```sh
mvn clean compile install -DskipTests
```

### Commands

```sh
./bin/ksql -h
```
