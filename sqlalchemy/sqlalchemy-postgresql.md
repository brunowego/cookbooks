# SQLAlchemy PostgreSQL

Install [Python-PostgreSQL Database Adapter (psycopg2)](/psycopg2)

## REPL

```py
>>> import sqlalchemy
>>>
>>> engine = sqlalchemy.create_engine('postgresql+psycopg2://user:pass@127.0.0.1:5432/dev')
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
