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
| admin | admin |

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
  -h mongo \
  -v mongo-data:/data/db \
  -e MONGO_INITDB_ROOT_USERNAME=root \
  -e MONGO_INITDB_ROOT_PASSWORD=root \
  -p 27017:27017 \
  --name mongo \
  --network workbench \
  docker.io/library/mongo:4.0
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
  jdbc{
    jdbc_driver_class => "com.dbschema.MongoJdbcDriver"
    jdbc_driver_library => "/usr/share/logstash/logstash-core/lib/jars/mongojdbc2.3.jar"
    jdbc_user => ""
    jdbc_password => ""
    jdbc_connection_string => "jdbc:mongodb://root:root@mongo:27017/database"
    schedule => "* * * * *"
    statement => "db.news.find({},{'_id': false});"
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
