# SSH

## Connection

1. Admin
2. Connections
3. \[Edit] ssh_default

## DAG

```py
from datetime import datetime, timedelta

from airflow import DAG
from airflow.contrib.hooks.ssh_hook import SSHHook
from airflow.contrib.operators.ssh_operator import SSHOperator

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime.today() - timedelta(days = 1)
}

sshHook = SSHHook(ssh_conn_id='ssh_default')
# hook.no_host_key_check = True

with DAG('ssh_operator_testing',
    default_args = default_args,
    schedule_interval = '@once') as dag:

    create_file = SSHOperator(
        task_id = 'create_file',
        ssh_hook = sshHook,
        command = 'touch airflow.txt && echo "try" >> airflow.txt'
    )

    create_file

```
