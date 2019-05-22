# PIP

## Dependencies

### MySQL

#### YUM

```sh
sudo yum check-update
sudo yum -y install python-devel mysql-devel
```

#### PostgreSQL

TODO

## Installation

```sh
pip install --no-cache-dir git+https://github.com/datadudes/cornet
```

### MySQL

```sh
pip install --no-cache-dir mysqlclient==1.4.2
```

### PostgreSQL

```sh
pip install --no-cache-dir psycopg2==2.7.7
```
