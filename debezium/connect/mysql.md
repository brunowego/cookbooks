# MySQL

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h zookeeper \
  -p 2182:2181 \
  -p 2888:2888 \
  -p 3888:3888 \
  --name debezium-zookeeper \
  --network workbench \
  docker.io/debezium/zookeeper:1.0

#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h kafka \
  -e ZOOKEEPER_CONNECT='debezium-zookeeper:2181' \
  -p 9092:9092 \
  --name debezium-kafka \
  --network workbench \
  docker.io/debezium/kafka:1.0

# Test
watch kafkacat -Lb 127.0.0.1:9092

#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h mysql \
  -e MYSQL_ROOT_PASSWORD='root' \
  -e MYSQL_USER='debezium' \
  -e MYSQL_PASSWORD='debezium' \
  -e MYSQL_DATABASE='inventory' \
  -v mysql-data:/var/lib/mysql \
  -p 3306:3306 \
  --name mysql \
  --network workbench \
  docker.io/library/mysql:5.7

#
docker exec -i mysql /bin/sh << EOSHELL
cat << EOF > /etc/mysql/conf.d/repl.cnf
[mysqld]
server-id = 1
log-bin = master-bin
binlog-format = ROW

EOF
EOSHELL

#
docker restart mysql

#
docker exec -i mysql /usr/bin/mysql -u root -p'root' -ve "SHOW GRANTS FOR 'debezium'@'%'"

#
docker exec -i mysql /usr/bin/mysql -u root -p'root' -ve "GRANT SUPER, REPLICATION CLIENT, REPLICATION SLAVE ON *.* TO 'debezium'@'%'"

#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h debezium-connect \
  -e BOOTSTRAP_SERVERS='debezium-kafka:9092' \
  -e GROUP_ID='1' \
  -e CONFIG_STORAGE_TOPIC='my_connect_configs' \
  -e OFFSET_STORAGE_TOPIC='my_connect_offsets' \
  -e STATUS_STORAGE_TOPIC='my_connect_statuses' \
  -p 8083:8083 \
  --name debezium-connect \
  --network workbench \
  docker.io/debezium/connect:1.0

#
curl \
  -X POST \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  http://127.0.0.1:8083/connectors \
  -d @<(cat << EOF
{
  "name": "inventory-connector",
  "config": {
    "connector.class": "io.debezium.connector.mysql.MySqlConnector",
    "tasks.max": "1",
    "database.hostname": "mysql",
    "database.port": "3306",
    "database.user": "debezium",
    "database.password": "debezium",
    "database.server.id": "184055",
    "database.server.name": "dbserver1",
    "database.whitelist": "inventory",
    "database.history.kafka.bootstrap.servers": "debezium-kafka:9092",
    "database.history.kafka.topic": "schema-changes.inventory",
    "transforms": "unwrap",
    "transforms.unwrap.type": "io.debezium.transforms.UnwrapFromEnvelope",
    "key.converter": "org.apache.kafka.connect.json.JsonConverter",
    "key.converter.schemas.enable": "false",
    "value.converter": "org.apache.kafka.connect.json.JsonConverter",
    "value.converter.schemas.enable": "false"
  }
}
EOF
)

#
kafkacat -Ct schema-changes.inventory -b 127.0.0.1:9092

kafkacat -Ct dbserver1 -b 127.0.0.1:9092

#
docker exec -i mysql \
  /usr/bin/mysql \
    -D inventory \
    -u debezium \
    -p'debezium' \
    -ve 'DROP TABLE IF EXISTS `users`'

docker exec -i mysql \
  /usr/bin/mysql \
    -D inventory \
    -u debezium \
    -p'debezium' \
    -v \
    <<-\EOSQL
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` bigint,
  `name` varchar(128),
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
EOSQL

docker exec -i mysql \
  /usr/bin/mysql \
    -D inventory \
    -u debezium \
    -p'debezium' \
    -ve 'INSERT INTO `users` (user_id, name) VALUES(1, "John")'

docker exec -i mysql \
  /usr/bin/mysql \
    -D inventory \
    -u debezium \
    -p'debezium' \
    -ve 'SELECT * FROM `users`'

docker exec -i mysql \
  /usr/bin/mysql \
    -D inventory \
    -u debezium \
    -p'debezium' \
    -ve 'UPDATE `users` SET name = "John Doe" WHERE user_id = 1'

#
echo -e '[INFO]\thttp://127.0.0.1:3000'
```

### Remove

```sh
docker rm -f \
  debezium-zookeeper \
  debezium-kafka \
  mysql \
  debezium-connect

docker volume rm mysql-data
```
