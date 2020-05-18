# Apache Superset

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
  -h redis \
  -v superset-redis-data:/data \
  --name superset-redis \
  --network workbench \
  docker.io/library/redis:5.0.4-alpine3.9 redis-server --appendonly yes
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h postgres \
  -e POSTGRES_USER='superset' \
  -e POSTGRES_PASSWORD='superset' \
  -e POSTGRES_DB='superset' \
  -v superset-postgres-data:/var/lib/postgresql/data \
  --name superset-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h superset \
  -v superset-config:/etc/superset \
  -v superset-configs:/home/superset \
  -v superset-data:/var/lib/superset \
  -p 8088:8088 \
  --name superset \
  --network workbench \
  docker.io/amancevice/superset:0.35.2
```

```sh
docker exec -i superset /bin/sh << EOSHELL
cat << EOF > /home/superset/superset_config.py
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
  --app 'superset' \
  --username 'admin' \
  --password 'admin' \
  --firstname 'user' \
  --lastname 'user' \
  --email 'admin@admin.org'
```

```sh
#
docker exec -i superset superset db upgrade

#
docker exec superset superset init

#
docker restart superset
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8088'
```

### Remove

```sh
docker rm -f superset-redis superset-postgres superset

docker volume rm superset-redis-data superset-postgres-data superset-config superset-configs superset-data
```

### Docs

#### Datasource

1. Sources
2. Druid Clusters -> Add a new record
   - Verbose Name: `druid-docker`
   - Broker Host: `druid-broker`
   - Cluster: `druid-docker`
   - Save
3. Sources -> Scan New Datasources

#### Dashboard

1. Dashboard -> Add a new record
   - Name: `Wikipedia`
   - Owners: Select `user user`
   - Published: Check
   - Save

#### Charts

1. Charts -> Add a new record
2. Create a new chart
   - Choose a datasource: Select `wikipedia`
   - Create new chart
3. Data Tab
   - Title: Count
   - Visualization Type: Big Number
   - Time Granularity: All
   - Time range: No filter
   - Run Query
   - Save
4. Save A Chart
