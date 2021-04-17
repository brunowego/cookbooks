# PIP

## Dependencies

### MySQL

#### YUM

```sh
yum check-update
sudo yum -y install python-devel mysql-devel
```

#### PostgreSQL

TODO

## Installation

```sh
pip3 install -U git+https://github.com/datadudes/cornet
```

### MySQL

```sh
pip3 install -U mysqlclient==1.4.2
```

### PostgreSQL

```sh
pip3 install -U psycopg2==2.7.7
```
