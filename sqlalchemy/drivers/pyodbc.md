# SQLAlchemy Microsoft SQL Server (pyodbc)

```sh
pip install sqlalchemy pyodbc
```

<!--
$env:COMPUTERNAME
-->

## REPL

```py
>>> import sqlalchemy
>>>
>>> engine = sqlalchemy.create_engine('mssql+pyodbc://user:pass@localhost\SQLEXPRESS/dbname?driver=ODBC+Driver+18+for+SQL+Server')
>>>
>>> conn = engine.raw_connection()
>>>
>>> cursor = conn.cursor()
>>> cursor.execute('SELECT CURRENT_TIMESTAMP')
>>>
>>> timestamp = cursor.fetchone()
>>> print(timestamp)
>>>
>>> conn.close()
>>> exit()
```
