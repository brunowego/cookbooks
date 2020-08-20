# Python-PostgreSQL Database Adapter (psycopg2)

## Library

### Dependencies

- [PostgreSQL](/postgresql.md#Docker)
- [Python 3](/python3.md#Docker)

#### APK

```sh
sudo apk update
sudo apk add postgresql-dev g++
```

### Instalation

```sh
pip install -U psycopg2-binary
```

### REPL

```py
>>> import psycopg2
>>> conn = psycopg2.connect(user='postgres', password='postgres', host='postgres')
>>> cur = conn.cursor()
>>> cur.execute('''SELECT datname FROM pg_database;''')
>>> cur.fetchall()
>>> cur.close()
>>> conn.close()
>>> exit()
```
