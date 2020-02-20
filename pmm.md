# Percona Monitoring and Management (PMM)

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h pmm2-server \
  -e SERVER_USER=admin \
  -e SERVER_PASSWORD=admin \
  -p 80:80 \
  -p 443:443 \
  --name pmm2-server \
  docker.io/percona/pmm-server:2.0.1
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:80'
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h percona-server \
  -e MYSQL_ROOT_PASSWORD=root \
  -p 3306:3306 \
  --name percona-server \
  docker.io/percona/percona-server:5.7.27
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h pmm-client-ps \
  -e PMM_SERVER=pmm2-server:443 \
  -e PMM_USER=admin \
  -e PMM_PASSWORD=admin \
  -e DB_TYPE=mysql \
  -e DB_HOST=percona-server \
  -e DB_PORT=3306 \
  -e DB_USER=root \
  -e DB_PASSWORD=root \
  -p 7777:7777 \
  --name pmm-client-ps \
  docker.io/percona/percona-xtradb-cluster-operator:1.2.0-pmm
```

```sh
docker run -i --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h percona-sysbench \
  --name percona-sysbench \
  docker.io/perconalab/sysbench:latest /bin/bash << EOSHELL
set -o xtrace

sleep 15

mysql \
  -h percona-server \
  -u root \
  -p'root' \
  -ve 'CREATE DATABASE IF NOT EXISTS sbtest'

sysbench \
  --db-driver mysql \
  --mysql-host percona-server \
  --mysql-user root \
  --mysql-password root \
  --mysql-db sbtest \
  --mysql-table-engine innodb \
  --oltp-table-size 1000000 \
  /usr/share/sysbench/tests/include/oltp_legacy/oltp.lua \
  prepare

sysbench \
  --threads 64 \
  --events 0 \
  --time 0 \
  --rate 200 \
  --report-interval 10 \
  --rand-type pareto \
  --db-driver mysql \
  --mysql-host percona-server \
  --mysql-port 3306 \
  --mysql-user root \
  --mysql-password root \
  --mysql-db sbtest \
  --mysql-table-engine innodb \
  --oltp-reconnect \
  --oltp-table-size 1000000 \
  /usr/share/sysbench/tests/include/oltp_legacy/select.lua \
  run
EOSHELL
```

### Remove

```sh
docker rm -f pmm2-server percona-server pmm-client-ps percona-sysbench
```
