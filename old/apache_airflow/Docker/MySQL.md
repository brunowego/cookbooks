# MySQL

## Volume

```sh
docker volume create airflow-mysql-data
docker volume create airflow-dags
```

## Running

```sh
docker run -d \
  -h mysql.airflow.local \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_USER=airflow \
  -e MYSQL_PASSWORD=airflow \
  -e MYSQL_DATABASE=airflow \
  -v airflow-mysql-data:/var/lib/mysql \
  -p 3306:3306 \
  --name airflow-mysql \
  mysql:5.7
```

```sh
docker run -d \
  -h airflow.local \
  -e LOAD_EX=n \
  -e EXECUTOR=Local \
  -e AIRFLOW__CORE__SQL_ALCHEMY_CONN='mysql://airflow:airflow@airflow-mysql:3306/airflow' \
  -e AIRFLOW__CELERY__RESULT_BACKEND='db+mysql://root:root@airflow-mysql:3306/airflow' \
  -v airflow-dags:/usr/local/airflow/dags \
  -p 8080:8080 \
  --name airflow \
  puckel/docker-airflow:1.10.2 webserver
```

## Remove

```sh
docker rm -f airflow-mysql airflow
docker volume rm airflow-mysql-data airflow-dags
```
