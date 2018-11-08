# Docker

## Volume

```sh
docker volume create postgres-data
docker volume create airflow-dags
```

## Running

```sh
docker run -d \
  -h postgres \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_DB=airflow \
  -v postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name postgres \
  --restart always \
  postgres:11.2-alpine
```

```sh
docker run -d \
  -h airflow \
  -e LOAD_EX=n \
  -e EXECUTOR=Local \
  -e POSTGRES_HOST=postgres \
  -e POSTGRES_PORT=5432 \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -v airflow-dags:/usr/local/airflow/dags \
  -p 8080:8080 \
  --name airflow \
  --restart always \
  --link postgres \
  puckel/docker-airflow:1.10.2 webserver
```

```sh
docker exec -i --user root airflow /bin/sh << 'SHELL'
cat << 'EOF' > /usr/local/airflow/dags/example.py
from datetime import datetime, timedelta
import logging
import time

from airflow import DAG
from airflow.operators.python_operator import PythonOperator

DAG_DEFAULT_ARGS = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime.today() - timedelta(days = 1)
}

def log_now():
    logging.info(datetime.now())

def do_sleep(t):
    time.sleep(t)

def log_bye():
    logging.info('Bye Bye')

with DAG('testing',
    default_args = DAG_DEFAULT_ARGS,
    schedule_interval = '@once') as dag:

    initial_time = PythonOperator(task_id = 'initial_time', python_callable = log_now)
    sleep = PythonOperator(task_id = 'sleep', python_callable = do_sleep, op_kwargs = {'t': 2})
    time_after_sleep = PythonOperator(task_id = 'time_after_sleep', python_callable = log_now)
    bye_greetings = PythonOperator(task_id = 'bye_greetings', python_callable = log_bye)

    initial_time >> sleep >> time_after_sleep >> bye_greetings

EOF
SHELL
```

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):8080"
```
