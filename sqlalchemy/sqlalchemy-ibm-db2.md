# SQLAlchemy IBM Db2

## Installation

### PIP

```sh
# As user dependency
pip3 install -U ibm-db ibm-db-sa

# As project dependency
cat << EOF >> ./requirements.txt
ibm-db==3.0.3
ibm-db-sa==0.3.6
EOF
```

## REPL

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
