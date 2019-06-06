# Kong

## Docker

### Volume

```sh
docker volume create kong-postgres-data
```

### Running

```sh
docker run -d \
  -h postgres.kong.local \
  -e POSTGRES_USER=kong \
  -e POSTGRES_PASSWORD=kong \
  -e POSTGRES_DB=kong \
  -v kong-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name kong-postgres \
  --restart always \
  postgres:11.2-alpine
```

```sh
docker run -i --rm \
  -e KONG_PG_HOST=kong-postgres \
  -e KONG_PG_USER=kong \
  -e KONG_PG_PASSWORD=kong \
  -e KONG_PG_DATABASE=kong \
  --name kong-migrations \
  --link kong-postgres \
  kong:1.1.2-alpine kong migrations bootstrap
```

```sh
docker run -d \
  -h kong.local \
  -e KONG_PG_HOST=kong-postgres \
  -e KONG_PG_USER=kong \
  -e KONG_PG_PASSWORD=kong \
  -e KONG_PG_DATABASE=kong \
  -e KONG_ADMIN_LISTEN=0.0.0.0:8001 \
  -p 8000:8000 \
  -p 8001:8001 \
  -p 8443:8443 \
  -p 8444:8444 \
  --name kong \
  --restart always \
  --link kong-postgres \
  kong:1.1.2-alpine
```

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):8001"
```

## Remove

```sh
docker rm -f kong-postgres kong
docker volume rm kong-postgres-data
```
