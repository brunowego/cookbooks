# SQLAlchemy

## Library

### Installation

#### PIP

```sh
# As user dependency
pip install -U SQLAlchemy

# As project dependency
echo 'SQLAlchemy==1.3.19' >> ./requirements.txt
```

### Usage

<!-- #### MongoDB

```sh
# As user dependency
pip install -U pymongo

# As project dependency
echo 'pymongo==3.11.0' >> ./requirements.txt
``` -->

#### PostgreSQL

```sh
# As user dependency
pip install -U psycopg2-binary

# As project dependency
echo 'psycopg2-binary==2.8.6' >> ./requirements.txt
```

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

#### MySQL

```sh
# As user dependency
pip install -U PyMySQL

# As project dependency
echo 'PyMySQL==0.10.1' >> ./requirements.txt
```

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

#### Db2

```sh
# As user dependency
pip install -U ibm_db_sa

# As project dependency
echo 'ibm-db-sa==0.3.5' >> ./requirements.txt
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
