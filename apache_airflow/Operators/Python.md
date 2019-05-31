# Python

## DAG

```py
from datetime import datetime, timedelta
import logging
import time

from airflow import DAG
from airflow.operators.python_operator import PythonOperator

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
