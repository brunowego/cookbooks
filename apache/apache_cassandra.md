# Apache Cassandra

<!--
https://github.com/instaclustr/cassandra-operator

https://app.pluralsight.com/library/courses/cassandra-developers/table-of-contents
https://app.pluralsight.com/library/courses/big-data-ldn-session-35/table-of-contents
https://app.pluralsight.com/library/courses/spark-kafka-cassandra-applying-lambda-architecture/table-of-contents

https://www.linkedin.com/learning/cassandra-data-modeling-essential-training/welcome
-->

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
  -v cassandra-data:/var/lib/cassandra \
  -p 9042:9042 \
  --name cassandra \
  --network workbench \
  docker.io/library/cassandra:3.11.10
```

<!-- ```sh
echo -e '[INFO]\thttp://127.0.0.1:9042'
```

| Login | Password |
| --- | --- |
| `admin` | `admin` | -->

### Remove

```sh
docker rm -f cassandra

docker volume rm cassandra-data
```

## CLI

### Installation

#### Homebrew

```sh
brew install cassandra
```

### Services

```sh
# Homebrew
brew services start cassandra
```

### Commands

```sh
cqlsh -h
```

### Queries

```sql
describe keyspaces
describe keyspace keyspace_name
describe tables
describe table table_name
use keyspace_name
select * from table_name
```
