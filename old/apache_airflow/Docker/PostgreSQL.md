# PostgreSQL

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

## Volume

```sh
docker volume create airflow-postgres-data
docker volume create airflow-dags
```

## Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h postgres.airflow.local \
  -e POSTGRES_USER=airflow \
  -e POSTGRES_PASSWORD=airflow \
  -e POSTGRES_DB=airflow \
  -v airflow-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name airflow-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h airflow.local \
  -e LOAD_EX=n \
  -e EXECUTOR=Local \
  -e POSTGRES_HOST=airflow-postgres \
  -e POSTGRES_USER=airflow \
  -e POSTGRES_PASSWORD=airflow \
  -e POSTGRES_DB=airflow \
  -v airflow-dags:/usr/local/airflow/dags \
  -p 8080:8080 \
  --name airflow \
  --network workbench \
  docker.io/puckel/docker-airflow:1.10.3 webserver
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

## Remove

```sh
docker rm -f airflow-postgres airflow
docker volume rm airflow-postgres-data airflow-dags
```
