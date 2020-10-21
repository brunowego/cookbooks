# IBM Db2

## References

- [Db2 Database](https://en.wikipedia.org/wiki/Db2_Database)
- [z/OS](https://en.wikipedia.org/wiki/Z/OS)

## CLI

### Installation

#### Dependencies

##### YUM

```sh
yum check-update
sudo yum -y install gcc python3-devel
```

#### Binary

```sh
# Linux
mkdir -p /opt/ibm/db2

# GNU Wget
wget -O - 'https://public.dhe.ibm.com/ibmdl/export/pub/software/data/db2/drivers/odbc_cli/linuxx64_odbc_cli.tar.gz' | tar -xzC /opt/ibm/db2

# cURL
curl 'https://public.dhe.ibm.com/ibmdl/export/pub/software/data/db2/drivers/odbc_cli/linuxx64_odbc_cli.tar.gz' | tar -xzC /opt/ibm/db2

#
export IBM_DB_HOME='/opt/ibm/db2/clidriver'
```

## Glossary

- IBM Db2 for LUW - Linux, UNIX and Windows
- IBM Db2 for z/OS (Mainframe) - z/OS is a 64-bit operating system for IBM mainframes, produced by IBM

<!-- ## CLI

```sh
/opt/IBM/db2/V10.1/instance/db2icrt

sudo chown db2inst1 /Users/db2inst1/sqllib/adm/*

db2start

db2sampl

db2 connect to sample

db2 "select count(0) from syscat.tables"
``` -->

## Library

### Dependencies

#### APT

```sh
sudo apt update
sudo apt -y install ksh
```

#### YUM

```sh
yum check-update
sudo yum -y install ksh unzip
```

### Installation

#### Linux

1. Open [IBM Data Server Client Packages - Version 11.5 GA](https://www.ibm.com/support/pages/download-initial-version-115-clients-and-drivers)
2. Click [IBM Data Server Driver Package (DS Driver)](https://www-01.ibm.com/marketing/iwm/iwm/web/dispatcher.do?source=swg-idsdpds)
3. Select IBM Data Server Driver Package (Linux AMD64 and Intel EM64T) -> Continue
4. Click on "I agree" and "I confirm"
5. Tab Download using http -> Download now

```sh
mkdir -p /opt/ibm/db2

tar -zxC /opt/ibm/db2 -f ./ibm_data_server_driver_package_linuxx64_v11.5.tar.gz

ksh /opt/ibm/db2/dsdriver/installDSDriver

export IBM_DB_HOME='/opt/ibm/db2/dsdriver'
export LD_LIBRARY_PATH="$IBM_DB_HOME/lib"
```

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
# Server
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h db2 \
  -v db2-database:/database \
  -v db2-hadr:/hadr \
  -e LICENSE='accept' \
  -e DB2INSTANCE='user' \
  -e DB2INST1_PASSWORD='pass' \
  -e DBNAME='dev' \
  -e ARCHIVE_LOGS='false' \
  -e AUTOCONFIG='false' \
  -p 50000:50000 \
  --memory-swappiness 0 \
  --name db2 \
  --network workbench \
  --privileged \
  --ulimit memlock=-1:-1 \
  docker.io/ibmcom/db2:11.5.0.0a
```

> Wait! This process take a while.

```sh
docker logs -f db2 | sed '/(*) Setup has completed./ q'
```

### Remove

```sh
docker rm -f db2
docker volume rm db2-database db2-hadr
```

<!-- ## Dockerfile

```Dockerfile
FROM

RUN yum -y install \
      gcc \
      python3-devel

RUN mkdir -p /opt/ibm/db2 && \
    wget -O - 'https://[]/linuxx64_odbc_cli.tar.gz' | \
      tar -xzC /opt/ibm/db2

ENV IBM_DB_HOME '/opt/ibm/db2/clidriver'
# ENV CLIDRIVER_LIB_PATH "$IBM_DB_HOME/lib"
# ENV DYLD_LIBRARY_PATH "$CLIDRIVER_LIB_PATH:$DYLD_LIBRARY_PATH"

RUN ln -s /opt/ibm/db2/clidriver/lib/libdb2.so.1 /usr/lib && \
    ln -s /opt/ibm/db2/clidriver/lib/libdb2.so.1 /usr/lib64

RUN pip install -q --no-cache-dir \
      ibm-db==3.0.1 \
      ibm-db-sa==0.3.5
``` -->

## Python

### Dependencies

#### APT

```sh
sudo apt update
sudo apt -y install python3-dev gcc
```

#### YUM

```sh
yum check-update
sudo yum -y install python3-devel gcc
```

### Installation

```sh
pip install -U ibm-db ibm-db-sa
```

### REPL

```py
>>> import ibm_db
>>> import ibm_db_dbi
>>>
>>> conn = ibm_db_dbi.connect('PORT=50000; PROTOCOL=TCPIP;', host='127.0.0.1', database='dev', user='user', password='pass')
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

### Issues

####

```py
Traceback (most recent call last):
  File "/usr/local/lib/python3.7/dist-packages/ibm_db_dbi.py", line 592, in connect
    conn = ibm_db.connect(dsn, '', '', conn_options)
Exception: [IBM][CLI Driver] SQL30081N  A communication error has been detected. Communication protocol being used: "TCP/IP".  Communication API being used: "SOCKETS".  Location where the error was detected: "172.17.78.128".  Communication function detecting the error: "connect".  Protocol specific error code(s): "113", "*", "*".  SQLSTATE=08001 SQLCODE=-30081

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/local/lib/python3.7/dist-packages/ibm_db_dbi.py", line 595, in connect
    raise _get_exception(inst)
ibm_db_dbi.OperationalError: ibm_db_dbi::OperationalError: Exception('[IBM][CLI Driver] SQL30081N  A communication error has been detected. Communication protocol being used: "TCP/IP".  Communication API being used: "SOCKETS".  Location where the error was detected: "172.17.78.128".  Communication function detecting the error: "connect".  Protocol specific error code(s): "113", "*", "*".  SQLSTATE=08001 SQLCODE=-30081')
```

TODO

####

```py
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ImportError: libdb2.so.1: cannot open shared object file: No such file or directory
```

```sh
ln -s /opt/ibm/db2/clidriver/lib/libdb2.so.1 /usr/lib
ln -s /opt/ibm/db2/clidriver/lib/libdb2.so.1 /usr/lib64
```

#### Library Path

```py
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ImportError: dlopen(/path/to/python3.x/site-packages/ibm_db.cpython-3xm-darwin.so, 2): Library not loaded: libdb2.dylib
  Referenced from: /path/to/python3.x/site-packages/ibm_db.cpython-3xm-darwin.so
  Reason: image not found
```

```sh
# export CLIDRIVER_LIB_PATH="$(python3 -c 'import site; print(site.getsitepackages()[0])')/clidriver/lib"

# Default
export CLIDRIVER_LIB_PATH=$(python3 -m site --user-site)/clidriver/lib

# Or, using pyenv
export CLIDRIVER_LIB_PATH="$HOME/.pyenv/versions/3.8.2/lib/python3.8/site-packages/clidriver/lib"

# Or, using Virtualenv
export CLIDRIVER_LIB_PATH="./.venv/lib/python3.8/site-packages/clidriver/lib"

export DYLD_LIBRARY_PATH="$CLIDRIVER_LIB_PATH:$DYLD_LIBRARY_PATH"

# install_name_tool -change libdb2.dylib "$CLIDRIVER_LIB_PATH/libdb2.dylib" ibm_db.so
```
