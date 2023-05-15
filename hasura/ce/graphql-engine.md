# Hasura GraphQL Engine

## Links

- [Code Repository](https://github.com/hasura/graphql-engine)

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
  -e POSTGRES_USER='hasura' \
  -e POSTGRES_PASSWORD='hasura' \
  -e POSTGRES_DB='hasura' \
  -v hasura-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name hasura-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine

#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h hasura-graphql-engine \
  -e HASURA_GRAPHQL_DATABASE_URL='postgres://hasura:hasura@hasura-postgres:5432/hasura' \
  -e HASURA_GRAPHQL_JWT_SECRET='{"type":"RS512", "key": "-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDdlatRjRjogo3WojgGHFHYLugd\nUWAY9iR3fy4arWNA1KoS8kVw33cJibXr8bvwUAUparCwlvdbH6dvEOfou0/gCFQs\nHUfQrSDv+MuSUMAe8jzKE4qW+jK+xQU9a03GUnKHkkle+Q0pX/g6jXZ7r1/xAK5D\no2kQ+X5xK9cipRgEKwIDAQAB\n-----END PUBLIC KEY-----\n"}' \
  -e HASURA_GRAPHQL_ADMIN_SECRET='S3cr3t_K@Key' \
  -e HASURA_GRAPHQL_UNAUTHORIZED_ROLE='public' \
  -e HASURA_GRAPHQL_LOG_LEVEL='debug' \
  -e HASURA_GRAPHQL_ENABLE_CONSOLE='true' \
  -p 8080:8080 \
  --name hasura-graphql-engine \
  --network workbench \
  docker.io/hasura/graphql-engine:v2.25.0-ce
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```sh
docker rm -f hasura-postgres hasura-graphql-engine

docker volume rm hasura-postgres-data
```
