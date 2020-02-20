# SQLAlchemy

## Library

### Installation

#### PIP

```sh
pip install SQLAlchemy
```

### Usage

#### Db2

```sh
pip install ibm_db_sa
```

```py
>>> import sqlalchemy
>>>
>>> engine = sqlalchemy.create_engine('db2+ibm_db://user:pass@127.0.0.1:50000/dev')
>>>
>>> conn = engine.raw_connection()
>>>
>>> cursor = conn.cursor()
>>> cursor.execute('SELECT CURRENT TIMESTAMP FROM "SYSIBM".SYSDUMMY1')
>>>
>>> timestamp = cursor.fetchone()
>>> print(timestamp)
>>>
>>> conn.close()
>>> exit()
```
