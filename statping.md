# Statping

**Keywords**: Status page

## References

- [Repository](https://github.com/statping/statping)

## CLI

### Installation

#### Darwin Binary

```sh
curl \
  -L "https://github.com/statping/statping/releases/download/$(curl -s https://api.github.com/repos/statping/statping/releases/latest | grep tag_name | cut -d '"' -f 4)/statping-darwin-amd64.tar.gz" | \
    tar -xzC /usr/local/bin
```

#### Linux Binary

```sh
sudo curl \
  -L "https://github.com/statping/statping/releases/download/$(curl -s https://api.github.com/repos/statping/statping/releases/latest | grep tag_name | cut -d '"' -f 4)/statping-linux-amd64.tar.gz" | \
    sudo tar -xzC /usr/local/bin
```

### Commands

```sh
statping -h
```

### Configuration

```sh
cat << EOF > ./config.yml
connection: sqlite3
language: en
allow_reports: true
location: $PWD
sqlfile: $PWD/statping.db
disable_http: false
demo_mode: false
disable_logs: false
use_assets: false
sample_data: false
use_cdn: false
disable_colors: false
EOF
```

### Running

```sh
statping -c ./config.yml
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'

# Dashboard
echo -e '[INFO]\thttp://127.0.0.1:8080/login'
```

```sh
# Stop
pkill statping
```

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
  -h postgres \
  -e POSTGRES_USER='statping' \
  -e POSTGRES_PASSWORD='statping' \
  -e POSTGRES_DB='statping' \
  -v statping-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name statping-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h statping \
  -e DB_CONN='postgres' \
  -e DB_HOST='statping-postgres' \
  -e DB_USER='statping' \
  -e DB_PASS='statping' \
  -e DB_DATABASE='statping' \
  -p 8080:8080 \
  --name statping \
  --network workbench \
  docker.io/hunterlong/statping:v0.90.45
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'

# Dashboard
echo -e '[INFO]\thttp://127.0.0.1:8080/login'
```

| Login | Password |
| --- | --- |
| `admin` | `admin` |

### Services

#### Apache Ambari

**Service Information**

| Parameter | Value |
| --- | --- |
| Service Name | `Ambari` |
| Service Type | `HTTP Service` |
| Group | `Management` |
| Permalink URL | `ambari` |
| Public Service | Yes |
| Check Interval | 10 seconds |

**Request Details**

| Parameter | Value |
| --- | --- |
| Service Endpoint (URL) | `` |
| Service Check Type | `` |
| Request Timeout | `` |
| HTTP Headers | `` |
| Expected Response (Regex) | `` |
| Expected Status Code | `` |
| Follow HTTP Redirects | `` |
| Verify SSL | `` |
| Use TLS Certificate | `` |

#### Apache HBase

TODO

#### Hue

TODO

#### Apache Livy

TODO

#### Apache Solr

TODO

#### Apache Spark

TODO

#### Apache Zookeeper

TODO

#### Apache Hive

TODO

#### Apache Kafka

**Service Information**

| Parameter | Value |
| --- | --- |
| Service Name | `Kafka` |
| Service Type | `HTTP Service` |
| Group | `Brokers` |
| Permalink URL | `kafka` |
| Public Service | Yes |
| Check Interval | 10 seconds |

**Request Details**

| Parameter | Value |
| --- | --- |
| Service Endpoint (URL) | `` |
| Service Check Type | `` |
| Request Timeout | `` |
| HTTP Headers | `` |
| Expected Response (Regex) | `` |
| Expected Status Code | `` |
| Follow HTTP Redirects | `` |
| Verify SSL | `` |
| Use TLS Certificate | `` |

#### Apache NiFi

**Service Information**

| Parameter | Value |
| --- | --- |
| Service Name | `NiFi` |
| Service Type | `HTTP Service` |
| Group | `Dataflow` |
| Permalink URL | `nifi` |
| Public Service | Yes |
| Check Interval | 10 seconds |

**Request Details**

| Parameter | Value |
| --- | --- |
| Service Endpoint (URL) | `` |
| Service Check Type | `` |
| Request Timeout | `` |
| HTTP Headers | `` |
| Expected Response (Regex) | `` |
| Expected Status Code | `` |
| Follow HTTP Redirects | `` |
| Verify SSL | `` |
| Use TLS Certificate | `` |

### Remove

```sh
docker rm -f statping-postgres statping

docker volume rm statping-postgres-data
```
