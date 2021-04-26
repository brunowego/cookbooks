# SQLAlchemy MySQL

Install [PyMySQL](/pymysql)

## REPL

```py
>>> import sqlalchemy
>>>
>>> engine = sqlalchemy.create_engine('mysql+pymysql://user:pass@127.0.0.1:3306/dev')
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
