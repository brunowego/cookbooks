# Sqoop

<!--
https://github.com/apache/airflow/blob/master/airflow/contrib/operators/sqoop_operator.py
https://airflow.apache.org/docs/apache-airflow-providers-apache-sqoop/1.0.1/_api/airflow/providers/apache/sqoop/operators/sqoop/index.html
https://github.com/rauldatascience/apache-sqoop-dag-cluster/blob/b8886ce3ce037dd8c4809d7e3768d7dcf034ed02/sqoop-incremental-import.py
https://github.com/lgov/airflow/blob/45f0331476ef1e3f2def55206b59dfb341393ebf/tests/providers/apache/sqoop/operators/test_sqoop.py

https://github.com/apache/airflow/blob/master/airflow/providers/apache/sqoop/operators/sqoop.py

https://www.youtube.com/watch?v=IFnT68LgTcs
-->

## DAG

```py
from datetime import datetime, timedelta
import logging
import time

from airflow import DAG
from airflow.providers.apache.sqoop.operators.sqoop import SqoopOperator

default_args = {
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

with DAG('python_operator_testing',
    default_args = default_args,
    schedule_interval = '@once') as dag:

    initial_time = PythonOperator(task_id = 'initial_time', python_callable = log_now)
    sleep = PythonOperator(task_id = 'sleep', python_callable = do_sleep, op_kwargs = {'t': 2})
    time_after_sleep = PythonOperator(task_id = 'time_after_sleep', python_callable = log_now)
    bye_greetings = PythonOperator(task_id = 'bye_greetings', python_callable = log_bye)

    initial_time >> sleep >> time_after_sleep >> bye_greetings

```
