# PostgreSQL

## Volume

```sh
docker volume create airflow-postgres-data
docker volume create airflow-dags
```

## Running

```sh
docker run -d \
  -h postgres.airflow.local \
  -e POSTGRES_USER=airflow \
  -e POSTGRES_PASSWORD=airflow \
  -e POSTGRES_DB=airflow \
  -v airflow-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name airflow-postgres \
  --restart always \
  postgres:11.2-alpine
```

```sh
docker run -d \
  -h app.airflow.local \
  -e LOAD_EX=n \
  -e EXECUTOR=Local \
  -e POSTGRES_HOST=airflow-postgres \
  -e POSTGRES_USER=airflow \
  -e POSTGRES_PASSWORD=airflow \
  -v airflow-dags:/usr/local/airflow/dags \
  -p 8080:8080 \
  --name airflow-app \
  --restart always \
  --link airflow-postgres \
  puckel/docker-airflow:1.10.2 webserver
```

## Remove

```sh
docker rm -f airflow-postgres airflow-app
docker volume rm airflow-postgres-data airflow-dags
```
