# Maxwell

<!--
https://github.com/zendesk/maxwell/issues/1412#issuecomment-573231508
-->

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h mysql \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_USER=maxwell \
  -e MYSQL_PASSWORD=maxwell \
  -e MYSQL_DATABASE=example \
  -v mysql-data:/var/lib/mysql \
  -p 3306:3306 \
  --name mysql \
  docker.io/library/mysql:5.7
```

```sh
docker exec -i mysql /bin/sh << EOSHELL
cat << EOF > /etc/mysql/conf.d/repl.cnf
[mysqld]
server-id = 1
log-bin = master-bin
binlog-format = ROW
# binlog-row-image = FULL

EOF
EOSHELL
```

```sh
docker restart mysql
```

```sh
#
docker exec -i mysql /usr/bin/mysql -u root -p'root' -ve "SHOW GRANTS FOR 'maxwell'@'%'"

#
docker exec -i mysql /usr/bin/mysql -u root -p'root' -ve "GRANT SUPER, REPLICATION CLIENT, REPLICATION SLAVE ON *.* TO 'maxwell'@'%'"
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h zookeeper \
  -v maxwell-zookeeper-data:/data \
  -v maxwell-zookeeper-log:/datalog \
  -p 2182:2181 \
  --name maxwell-zookeeper \
  docker.io/library/zookeeper:3.5.6
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h kafka \
  -e KAFKA_PORT=9092 \
  -e KAFKA_LISTENERS=PLAINTEXT://kafka:9092 \
  -e KAFKA_ZOOKEEPER_CONNECT=maxwell-zookeeper:2181 \
  -e KAFKA_CREATE_TOPICS='users:4:1' \
  -v maxwell-kafka-data:/var/lib/kafka/data \
  -p 9092:9092 \
  --name maxwell-kafka \
  docker.io/wurstmeister/kafka:2.12-2.3.0
```

```sh
# Test Kafka
watch kafkacat -Lb 127.0.0.1:9092
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h maxwell \
  --name maxwell \
  docker.io/zendesk/maxwell:v1.24.0 ./bin/maxwell \
    --host 'mysql' \
    --port '3306' \
    --user 'maxwell' \
    --password 'maxwell' \
    --producer 'kafka' \
    --schema_database 'example' \
    --kafka.bootstrap.servers 'maxwell-kafka:9092' \
    --kafka_topic 'users' \
    --output_primary_keys 'true' \
    --output_primary_key_columns 'true' \
    --output_ddl 'true'
```

```sh
#
sudo hostess add kafka 127.0.0.1

#
kafkacat -Ct users -b 127.0.0.1:9092
```

```sh
docker exec -i mysql /usr/bin/mysql -D example -u maxwell -p'maxwell' -ve 'DROP TABLE IF EXISTS `users`'

docker exec -i mysql /usr/bin/mysql -D example -u maxwell -p'maxwell' -v <<-\EOSQL
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` bigint,
  `name` varchar(128),
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
EOSQL

docker exec -i mysql /usr/bin/mysql -D example -u maxwell -p'maxwell' -ve 'SELECT * FROM `users`'

docker exec -i mysql /usr/bin/mysql -D example -u maxwell -p'maxwell' -ve 'INSERT INTO `users` (user_id, name) VALUES(1, "John")'

docker exec -i mysql /usr/bin/mysql -D example -u maxwell -p'maxwell' -ve 'UPDATE `users` SET name = "John Doe" WHERE user_id = 1'
```

### Remove

```sh
docker rm -f mysql maxwell-zookeeper maxwell-kafka maxwell
docker volume rm mysql-data maxwell-zookeeper-data maxwell-zookeeper-log maxwell-kafka-data
```

## CLI

### Installation

#### Homebrew

```sh
brew install maxwell
```

### Commands

```sh
maxwell --help all
```

### Usage

```sh
# Kafka
maxwell --config

maxwell \
  --host '127.0.0.1' \
  --port '3306' \
  --user 'root' \
  --password 'root' \
  --producer 'kafka' \
  --schema_database 'example' \
  --kafka.bootstrap.servers '127.0.0.1:9092' \
  --kafka_topic 'users' \
  --output_primary_keys 'true' \
  --output_primary_key_columns 'true' \
  --output_ddl 'true'
```
