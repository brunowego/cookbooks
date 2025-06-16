# SQLAlchemy Microsoft SQL Server

```sh
pip install sqlalchemy pymssql
```

## REPL

```py
>>> import sqlalchemy
>>>
>>> engine = sqlalchemy.create_engine('mssql+pymssql://sa:<password>@<server-name>:1433/<db-name>')
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

## Issues

### TBD

```log
pymssql._mssql.MSSQLDatabaseException: (20009, b'DB-Lib error message 20009, severity 9:\nUnable to connect: Adaptive Server is unavailable or does not exist (EC2AMAZ-T1D2S1Q\x082wdata)\n')

During handling of the above exception, another exception occurred:
```

<!--
ping EC2AMAZ-T1D2S1Q
telnet EC2AMAZ-T1D2S1Q 1433
-->

TODO
