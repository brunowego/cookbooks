# Python-PostgreSQL Database Adapter (psycopg2)

## Library

### Dependencies

- [PostgreSQL](/postgresql.md#Docker)
- [Python 3](/python3.md#Docker)

#### APK

```sh
sudo apk update
sudo apk add postgresql-dev g++ python3-dev
```

### Installation

```sh
# As user dependency
pip install -U psycopg2-binary

# As project dependency
echo 'psycopg2-binary==2.8.6' >> ./requirements.txt
```

### REPL

```py
>>> import psycopg2
>>>
>>> conn = psycopg2.connect(user='postgres', password='postgres', host='127.0.0.1')
>>>
>>> cur = conn.cursor()
>>> cur.execute('SELECT CURRENT_TIMESTAMP')
>>> cur.fetchone()
>>> cur.close()
>>>
>>> conn.close()
>>> exit()
```

### Issues

#### Python Headers

```log
fatal error: Python.h: No such file or directory
```

```sh
# APT
sudo apt -y install python3-dev

# YUM
sudo apt -y install python3-devel

# Zypper
sudo zypper in python3-devel

# APK
sudo apk add python3-dev
```

#### Library PG

```log
Error loading psycopg2 module: Error loading shared library libpq.so.5: No such file or directory
```

```sh
# APK
apk add libpq
```
