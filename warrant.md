# Warrant

**Keywords:** Authz

## Links

- [Code Repository](https://github.com/warrant-dev/warrant)
- [Main Website](https://warrant.dev)
- Docs
  - [API Reference](https://docs.warrant.dev/objecttypes/get-all-object-types/)

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
  -h postgres \
  -e POSTGRES_USER='warrant' \
  -e POSTGRES_PASSWORD='warrant' \
  -e POSTGRES_DB='warrant' \
  -v warrant-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name warrant-postgres \
  --network workbench \
  docker.io/library/postgres:14.7-alpine

#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h warrant \
  -e WARRANT_PORT='8000' \
  -e WARRANT_LOGLEVEL='1' \
  -e WARRANT_ENABLEACCESSLOG='true' \
  -e WARRANT_DATASTORE='postgres' \
  -e WARRANT_DATASTORE_POSTGRES_USERNAME='warrant' \
  -e WARRANT_DATASTORE_POSTGRES_PASSWORD='warrant' \
  -e WARRANT_DATASTORE_POSTGRES_HOSTNAME='warrant-postgres' \
  -e WARRANT_DATASTORE_POSTGRES_DATABASE='warrant' \
  -e WARRANT_DATASTORE_POSTGRES_SSLMODE='disable' \
  -e WARRANT_EVENTSTORE='postgres' \
  -e WARRANT_EVENTSTORE_POSTGRES_USERNAME='warrant' \
  -e WARRANT_EVENTSTORE_POSTGRES_PASSWORD='warrant' \
  -e WARRANT_EVENTSTORE_POSTGRES_HOSTNAME='warrant-postgres' \
  -e WARRANT_EVENTSTORE_POSTGRES_DATABASE='warrant_events' \
  -e WARRANT_EVENTSTORE_POSTGRES_SSLMODE='disable' \
  -e WARRANT_APIKEY='replace_with_api_key' \
  -e WARRANT_AUTHENTICATION_PROVIDER='replace_with_authentication_name' \
  -e WARRANT_AUTHENTICATION_PUBLICKEY='replace_with_authentication_public_key' \
  -e WARRANT_AUTHENTICATION_USERIDCLAIM='replace_with_authentication_user_id_claim' \
  -e WARRANT_AUTHENTICATION_TENANTIDCLAIM='replace_with_authentication_tenant_id_claim' \
  -p 8000:8000 \
  --name warrant \
  --network workbench \
  docker.io/warrantdev/warrant:v0.10.0
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8000'
```

| Login   | Password |
| ------- | -------- |
| `admin` | `admin`  |

### Shell

```sh
docker exec -it grafana /bin/bash
```

### Remove

```sh
docker rm -f warrant-postgres warrant

docker volume rm warrant-postgres-data
```

## CLI

### Installation

#### Homebrew

```sh
brew tap warrant-dev/warrant
brew install warrant
```

### Commands

```sh
warrant -h
```

### Initialize

```sh
warrant init
```

### Usage

```sh
#
warrant
```

## Server

### Configuration

**Refer:** `./warrant.yml`

```yml
---
port: 8000
logLevel: 1
enableAccessLog: 'true'
apiKey: replace_with_api_key

datastore:
  postgres:
    username: warrant
    password: warrant
    hostname: 127.0.0.1
    database: warrant
    sslmode: disable

eventstore:
  postgres:
    username: warrant
    password: warrant
    hostname: 127.0.0.1
    database: warrant_events
    sslmode: disable
```

### Usage

```sh
#
warrant
```
