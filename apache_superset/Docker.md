# Docker

## Volume

```sh
docker volume create superset-redis-data
docker volume create superset-postgres-data
docker volume create superset-config
```

## Running

```sh
docker run -d \
  -h redis.superset.local \
  -v superset-redis-data:/data \
  -p 6379:6379 \
  --name superset-redis \
  --restart always \
  redis:5.0.4-alpine3.9 redis-server --appendonly yes
```

```sh
docker run -d \
  -h postgres.superset.local \
  -e POSTGRES_USER=superset \
  -e POSTGRES_PASSWORD=superset \
  -e POSTGRES_DB=superset \
  -v superset-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name superset-postgres \
  --restart always \
  postgres:11.2-alpine
```

```sh
docker run -d \
  -h superset.local \
  -v superset-config:/etc/superset \
  -p 8088:8088 \
  --name superset \
  --restart always \
  --link superset-redis \
  --link superset-postgres \
  amancevice/superset:0.28.1
```

```sh
docker exec -i superset /bin/sh << 'EOSHELL'
cat << 'EOF' > /etc/superset/superset_config.py
import os

MAPBOX_API_KEY = os.getenv('MAPBOX_API_KEY', '')
CACHE_CONFIG = {
    'CACHE_TYPE': 'redis',
    'CACHE_DEFAULT_TIMEOUT': 300,
    'CACHE_KEY_PREFIX': 'superset_',
    'CACHE_REDIS_HOST': 'superset-redis',
    'CACHE_REDIS_PORT': 6379,
    'CACHE_REDIS_DB': 1,
    'CACHE_REDIS_URL': 'redis://superset-redis:6379/1'}
SQLALCHEMY_DATABASE_URI = \
    'postgresql+psycopg2://superset:superset@superset-postgres:5432/superset'
SQLALCHEMY_TRACK_MODIFICATIONS = True
SECRET_KEY = 'thisISaSECRET_1234'

EOF
EOSHELL
```

```sh
docker exec -i superset fabmanager create-admin \
  --app superset \
  --username admin \
  --password admin \
  --firstname user \
  --lastname user \
  --email admin@admin.org
```

```sh
docker exec -i superset superset db upgrade
```

```sh
docker exec superset superset init
```

```sh
docker restart superset
```

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):8088"
```

## Remove

```sh
docker rm -f superset-redis superset-postgres superset
docker volume rm superset-redis-data superset-postgres-data superset-config
```
