# SSH

## Connection

1. Admin
2. Connections
3. \[Edit] mysql_default

> Make sure that the schema exists in the database.

## DAG

```py
from datetime import datetime, timedelta

from airflow import DAG
from airflow.operators.mysql_operator import MySqlOperator

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime.today() - timedelta(days = 1)
}

with DAG('mysql_operator_testing',
    default_args = default_args,
    schedule_interval = '@once') as dag:

    create_db = MySqlOperator(
        task_id = 'create_db',
        mysql_conn_id = 'mysql_default',
        sql = 'CREATE DATABASE `test`'
    )

    create_db

```
