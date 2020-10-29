# Logstash

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
  -h logstash \
  -p 5044:5044 \
  -p 9600:9600 \
  --name logstash \
  --network workbench \
  docker.io/library/logstash:7.9.1
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:3000'
```

| Login | Password |
| --- | --- |
| `admin` | `admin` |

### Shell

```sh
docker exec -itu root logstash /bin/bash
```

### Plugins

```sh
# Output
logstash-plugin install logstash-output-mongodb
logstash-plugin install --version=3.1.5 logstash-output-mongodb

# Filter
logstash-plugin install logstash-filter-json

# Input
logstash-plugin install logstash-input-jdbc
logstash-plugin install logstash-input-mongodb
logstash-plugin install logstash-input-beats

# Codec
logstash-plugin update logstash-codec-netflow
```

### Remove

```sh
docker rm -f logstash
```

## Use case

### Logstash Input MongoDB

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h elasticsearch \
  -e discovery.type=single-node \
  -v elasticsearch-config:/usr/share/elasticsearch/config \
  -v elasticsearch-data:/usr/share/elasticsearch/data \
  -v elasticsearch-logs:/usr/share/elasticsearch/logs \
  -p 9200:9200 \
  -p 9300:9300 \
  --name elasticsearch \
  --network workbench \
  docker.io/library/elasticsearch:7.9.1
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h mongo \
  -v mongo-data:/data/db \
  -v mongo-configdb:/data/configdb \
  -e MONGO_INITDB_ROOT_USERNAME='user' \
  -e MONGO_INITDB_ROOT_PASSWORD='pass' \
  -p 27017:27017 \
  --name mongo \
  --network workbench \
  docker.io/library/mongo:4.0.20
```

```sh
docker exec mongo mongo \
  -u root \
  -p root \
  --eval 'printjson(db.adminCommand("listDatabases"))'

docker exec -i mongo mongo \
  -u root \
  -p root \
  --authenticationDatabase admin <<-EOSQL
use dev
db.createCollection('news')
db.news.insert({some_key: 'some_value'})
EOSQL

docker exec mongo mongo \
  -u root \
  -p root \
  --authenticationDatabase admin \
  dev --eval 'db.news.find({}, {"_id": false})'
```

Run [Logstash with Docker](#running)

```sh
docker exec -iu root logstash /bin/sh -c 'yum -y install bsdtar'
```

```sh
docker exec -i logstash /bin/bash << \EOSHELL
curl https://dbschema.com/jdbc-drivers/MongoDbJdbcDriver.zip | \
  bsdtar -xf - -C /usr/share/logstash/logstash-core/lib/jars
EOSHELL
```

```sh
docker exec -i logstash /bin/bash << \EOSHELL
cat << \EOF > /usr/share/logstash/pipeline/logstash.conf
input {
  jdbc {
    jdbc_driver_class => 'com.dbschema.MongoJdbcDriver'
    jdbc_driver_library => '/usr/share/logstash/logstash-core/lib/jars/mongojdbc2.3.jar'
    jdbc_user => ''
    jdbc_password => ''
    jdbc_connection_string => 'jdbc:mongodb://root:root@mongo:27017/dev?authSource=admin'
    schedule => '* * * * *'
    statement => 'db.news.find({}, {"_id": false});'
  }
}

output {
  stdout {
    codec => rubydebug
  }
}

EOF
EOSHELL
```

```sh
docker restart logstash && \
  docker logs -f logstash
```

### Remove

```sh
docker rm -f elasticsearch mongo logstash

docker volume rm elasticsearch-config elasticsearch-data elasticsearch-logs mongo-data mongo-configdb
```

<!-- ###

```
# CLASSPATH $CLASSPATH:/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.191.b12-1.el7_6.x86_64/jre/lib

com.dbschema.MongoJdbcDriver
mongojdbc1.2.jar

# https://github.com/rmmenezes/prototipo-arq-mononitoramento
# https://github.com/rizkisamsul/workshop-kazee/tree/8171107a0ebd073ae7caafa7dd4551451dd648e9/docker/driver/MongoDbJdbcDriver

# MongoDB
( cd /usr/share/logstash/logstash-core/lib/jars && curl -O https://search.maven.org/remotecontent?filepath=org/mongodb/mongodb-jdbc/1.0.0/mongodb-jdbc-1.0.0.jar )

# https://repo1.maven.org/maven2/org/mongodb/mongo-java-driver/3.8.2/mongo-java-driver-3.8.2.jar

# SQL Server
# COPY sqljdbc42.jar /usr/share/logstash/logstash-core/lib/jars/sqljdbc42.jar

# MySQL
# curl -L https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.49.tar.gz | tar -xzC /opt/nifi/nifi-current/lib mysql-connector-java-5.1.49/mysql-connector-java-5.1.49.jar --strip-components 1

# COPY mysql-connector-java-5.1.36-bin.jar /usr/share/logstash/logstash-core/lib/jars/mysql-connector-java-5.1.36-bin.jar
``` -->

<!--
# docker exec mongo mongo \
#   -u root \
#   -p root \
#   --eval 'printjson(db.serverStatus())'

docker exec mongo mongo \
  -u root \
  -p root \
  --authenticationDatabase admin \
  --eval 'db.createUser({user: "dev", pwd: "dev", roles:[{role: "readWrite", db: "dev"}]})'

docker exec mongo mongo \
  -u dev \
  -p dev \
  --authenticationDatabase dev \
  dev --eval 'db.system.users.find({}, {"_id" : 1})'

docker exec mongo mongo \
  -u dev \
  -p dev \
  --authenticationDatabase dev \
  --eval 'db.getUsers()'

docker exec mongo mongo \
  -u dev \
  -p dev \
  --authenticationDatabase dev \
  --eval 'printjson(db.getCollectionNames())'

docker exec mongo mongo \
  -u dev \
  -p dev \
  --authenticationDatabase dev \
  --eval 'db.news.find({}, {"_id": false})'

# docker exec mongo mongo \
#   -u dev \
#   -p dev \
#   dev --eval 'rs.status()'

# docker exec mongo mongo \
#   -u root \
#   -p root \
#   dev --eval 'db.createCollection("news")'

# docker exec mongo mongo \
#   -u root \
#   -p root \
#   dev --eval 'db.news.createIndex({"bucketId": 1})'
-->
