# Anemometer

## Docker

### Build

```sh
cat << EOF | docker build $(echo $DOCKER_BUILD_OPTS) -t example/anemometer -
FROM docker.io/boxinc/anemometer:develop

RUN sed -i '/^Listen/ s/80/10080/' /etc/httpd/conf/httpd.conf

RUN ( cd ./conf && mv ./sample.config.inc.php ./config.inc.php )

# FIXME: https://github.com/box/Anemometer/issues/175
RUN sed -i 's/0000-00-00 00:00:00/1990-01-01 00:00:00/g' ./install.sql
RUN sed -i 's/0000-00-00 00:00:00/1990-01-01 00:00:00/g' ./mysql56-install.sql

EXPOSE 10080

CMD ["/docker-entrypoint.py"]

EOF
```

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h mysql \
  -e MYSQL_ROOT_PASSWORD=root \
  -v anemometer-mysql-data:/var/lib/mysql \
  -p 3306:3306 \
  --name anemometer-mysql \
  mysql:5.6
```

```sh
docker exec -i anemometer-mysql /bin/sh << 'EOSHELL'
cat << EOF > /etc/mysql/conf.d/increase.cnf
[mysqld]
wait_timeout = 360000
innodb_log_file_size = 128MB
max_allowed_packet = 128M

EOF
EOSHELL
```

```sh
docker exec -i anemometer-mysql /bin/sh << 'EOSHELL'
cat << EOF > /etc/mysql/conf.d/log-slow.cnf
[mysqld]
slow_query_log = 1
log_queries_not_using_indexes = 1

EOF
EOSHELL
```

```sh
docker restart anemometer-mysql
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h anemometer \
  -e ANEMOMETER_MYSQL_HOST='anemometer-mysql' \
  -e ANEMOMETER_MYSQL_PORT=3306 \
  -e ANEMOMETER_MYSQL_USER=root \
  -e ANEMOMETER_MYSQL_PASSWORD=root \
  -e ANEMOMETER_MYSQL_DB=slow_query_log \
  -p 10080:10080 \
  --name anemometer \
  example/anemometer:latest
```

```sh
docker exec -i anemometer /bin/sh << \EOSHELL
cat << \EOF > /var/www/html/conf/datasource_localhost.inc.php
<?php
$conf['datasources']['localhost'] = array(
	'host'	=> 'anemometer-mysql',
	'port'	=> 3306,
	'db'	=> 'slow_query_log',
	'user'	=> 'root',
	'password' => 'root',
	'tables' => array(
		'global_query_review' => 'fact',
		'global_query_review_history' => 'dimension'
	),
	'source_type' => 'slow_query_log'
);

EOF
EOSHELL
```

```sh
docker restart anemometer
```

## Remove

```sh
docker rm -f anemometer-mysql anemometer
docker volume rm anemometer-mysql-data
```
