# Python-PostgreSQL Database Adapter (psycopg2)

## Library

### Dependencies

- [Python Development](/python/dev.md)
- [g++](/g++.md)
- [PostgreSQL Client](/postgresql/client.md#cli)

### Installation

```sh
# As user dependency
pip3 install -U psycopg2-binary

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

#### Missing Library

```log
Error: pg_config executable not found.
```

Just install [PostgreSQL Develop](/postgresql/dev.md#library) library.

#### Python Headers

```log
fatal error: Python.h: No such file or directory
```

```sh
# APT
sudo apt -y install python3-dev

# YUM
sudo yum -y install python3-devel

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
