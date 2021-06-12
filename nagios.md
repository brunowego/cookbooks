# Nagios

<!--
https://www.linkedin.com/learning/learning-nagios/welcome
-->

**Keywords:** Monitoring System

## Alternatives

- [splunk](/splunk.md)

## Docker

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
  -e MYSQL_ROOT_PASSWORD='nagios' \
  -e MYSQL_USER='nagios' \
  -e MYSQL_PASSWORD='nagios' \
  -e MYSQL_DATABASE='nagios' \
  -v nagios-mysql-data:/var/lib/mysql \
  -p 3306:3306 \
  --name nagios-mysql \
  --network workbench \
  docker.io/library/mysql:5.7
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h nagios \
  -e MYSQL_ADDRESS='nagios-mysql' \
  -e MYSQL_DATABASE='nagios' \
  -e MYSQL_USER='nagios' \
  -e MYSQL_PASSWORD='nagios' \
  -e NAGIOSADMIN_USER='admin' \
  -e NAGIOSADMIN_PASS='admin' \
  -v nagios-plugin:/data/plugin \
  -v nagios-config:/usr/local/nagios/etc/mount \
  -v nagios-data:/data/example \
  -p 8080:80 \
  -p 3000:3000 \
  --name nagios \
  --network workbench \
  docker.io/ethnchao/nagios:4.4.6 \
    --enable-ndo \
    --create-db \
    --server-url http://127.0.0.1:8080
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

| Login | Password |
| --- | --- |
| `admin` | `admin` |

### Remove

```sh
docker rm -f nagios-mysql nagios

docker volume rm nagios-mysql-data nagios-plugin nagios-config nagios-data
```

## CLI

### Installation

#### Homebrew

```sh
brew install nagios
```

### Configuration

```sh
# Homebrew
mkdir -p /usr/local/var/lib/nagios/rw
sudo chgrp _www /usr/local/var/lib/nagios/rw
sudo chmod 2775 /usr/local/var/lib/nagios/rw

/etc/apache2/httpd.conf
+LoadModule php5_module libexec/apache2/libphp5.so
+LoadModule cgi_module libexec/apache2/mod_cgi.so

sudo ln -sf /usr/local/opt/nagios/share/nagios.conf /etc/apache2/other/
htpasswd -cs /usr/local/etc/nagios/htpasswd.users nagiosadmin
sudo apachectl restart
```

### Services

```sh
# Homebrew
brew services start nagios

# Or, using CLI
nagios /usr/local/etc/nagios/nagios.cfg
```

<!--
## Interview

https://www.youtube.com/watch?v=mEk678Xcuks
-->
