# Redash

## Docker

### Volume

```sh
docker volume create redash-redis-data
docker volume create redash-postgres-data
```

### Running

```sh
docker run -d \
  -h redis.redash.local \
  -v redash-redis-data:/data \
  -p 6379:6379 \
  --name redash-redis \
  --restart always \
  redis:5.0.5-alpine3.9 redis-server --appendonly yes
```

```sh
docker run -d \
  -h postgres.redash.local \
  -e POSTGRES_USER=redash \
  -e POSTGRES_PASSWORD=redash \
  -e POSTGRES_DB=redash \
  -v redash-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name redash-postgres \
  --restart always \
  postgres:11.2-alpine
```

```sh
docker run -d \
  -h server.redash.local \
  -e PYTHONUNBUFFERED=0 \
  -e REDASH_LOG_LEVEL=INFO \
  -e REDASH_REDIS_URL=redis://redash-redis:6379/0 \
  -e REDASH_DATABASE_URL=postgresql://redash:redash@redash-postgres/redash \
  -e REDASH_RATELIMIT_ENABLED=false \
  -p 5000:5000 \
  -p 5678:5678 \
  --name redash-server \
  --restart always \
  --link redash-redis \
  --link redash-postgres \
  redash/redash:7.0.0.b18042 server
```

```sh
docker run -d \
  -h worker.redash.local \
  -e PYTHONUNBUFFERED=0 \
  -e REDASH_LOG_LEVEL=INFO \
  -e REDASH_REDIS_URL=redis://redash-redis:6379/0 \
  -e REDASH_DATABASE_URL=postgresql://redash:redash@redash-postgres/redash \
  -e QUEUES='queries,scheduled_queries,celery,schemas' \
  -e WORKERS_COUNT=2 \
  --name redash-worker \
  --restart always \
  --link redash-redis \
  --link redash-postgres \
  --link redash-server \
  redash/redash:7.0.0.b18042 scheduler
```

```sh
docker exec redash-server /app/bin/docker-entrypoint create_db
```

```sh
docker exec redash-server /app/bin/docker-entrypoint manage users create_root \
  --org Example \
  --password admin \
  admin@example.com \
  admin
```

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):5000"
```

| Login | Password |
| --- | --- |
| admin | admin |

## Remove

```sh
docker rm -f redash-redis redash-postgres redash-server redash-worker
docker volume rm redash-redis-data redash-postgres-data
```
