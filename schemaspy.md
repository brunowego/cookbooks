# SchemaSpy

## References

- [Git Repository](https://github.com/schemaspy/schemaspy)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

#### through Properties

```sh
cat << EOF > ./schemaspy.properties
schemaspy.t=mysql
schemaspy.host=127.0.0.1
schemaspy.port=3306
schemaspy.db=[dbname]
schemaspy.s=[schema]
schemaspy.u=[user]
schemaspy.p=[password]
schemaspy.connprops="useSSL\=false"
EOF
```

```sh
docker run --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h schemaspy \
  -v "$PWD"/schemaspy.properties:/schemaspy.properties \
  -v "$PWD"/schemaspy:/output \
  --name schemaspy \
  --network workbench \
  docker.io/schemaspy/schemaspy:6.1.0
```

#### Through CLI

```sh
docker run --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h schemaspy \
  -v "$PWD"/schemaspy:/output \
  --name schemaspy \
  --network workbench \
  docker.io/schemaspy/schemaspy:6.1.0 \
    -t mysql \
    -host 127.0.0.1 \
    -port 3306 \
    -db [dbname] \
    -s [schema] \
    -u [user] \
    -p [password] \
    -connprops useSSL\\=false
```

### Remove

```sh
docker rm -f schemaspy
```

## CLI

### Dependencies

- [OpenJDK](/openjdk.md)
- [Graphviz](/graphviz.md)

### Installation

#### JAR

```sh
sudo curl \
  -L 'https://github.com/schemaspy/schemaspy/releases/download/v6.1.0/schemaspy-6.1.0.jar' \
  -o "${JAVA_HOME}/lib/schemaspy.jar"
```

### Commands

```sh
java -jar "${JAVA_HOME}/lib/schemaspy.jar" -h

# DB
java -jar "${JAVA_HOME}/lib/schemaspy.jar" --dbHelp
```

### Usage

#### PostgreSQL

```sh
# Driver
curl https://jdbc.postgresql.org/download/postgresql-9.4-1201.jdbc4.jar \
  -o /tmp/postgresql-9.4-1201.jdbc4.jar

# Generate
java -jar "${JAVA_HOME}/lib/schemaspy.jar" \
  -t pgsql \
  -host 127.0.0.1 \
  -port 5432 \
  -db [dbname] \
  -s public \
  -u [user] \
  -p [password] \
  -o /path/to/ouput \
  -dp /tmp/postgresql-9.4-1201.jdbc4.jar
```

#### MySQL

```sh
# Driver
curl http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.47/mysql-connector-java-5.1.47.jar \
  -o /tmp/mysql-connector-java-5.1.47.jar

# Generate
java -jar "${JAVA_HOME}/lib/schemaspy.jar" \
  -t mysql \
  -host 127.0.0.1 \
  -port 3306 \
  -db [dbname] \
  -s [schema] \
  -u [user] \
  -p [password] \
  -o /path/to/ouput \
  -dp /tmp/mysql-connector-java-5.1.47.jar \
  -connprops useSSL\\=false
```

#### DB2 for z/OS

```sh
# Driver
curl https://artifacts.alfresco.com/nexus/content/repositories/public/com/ibm/db2/jcc/db2jcc4/10.1/db2jcc4-10.1.jar \
  -o /tmp/db2jcc4-10.1.jar

# Generate
java -jar "${JAVA_HOME}/lib/schemaspy.jar" \
  -t db2zosnet \
  -host 127.0.0.1 \
  -port 50000 \
  -db [dbname] \
  -cat [] \
  -s [schema] \
  -u [user] \
  -p [password] \
  -o ./schemaspy \
  -dp /tmp/db2jcc4-10.1.jar \
  -debug
```
