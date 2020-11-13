# Matomo (A.k.a Piwik)

<!--
https://github.com/brunowego/HenriquetSteve_TFE_Juin2019
https://github.com/hotosm/matomo-tracking
https://github.com/ministryofjustice/matomo-scrape
https://github.com/BytemarkHosting/configs-matomo-docker
-->

## References

- [Builds](https://builds.matomo.org/)
- [Tracking HTTP API](https://developer.matomo.org/api-reference/tracking-api)
- [JavaScript Tracking Client](https://developer.matomo.org/api-reference/tracking-javascript)
- [API Reference](https://developer.matomo.org/api-reference)
  - [Events](https://developer.matomo.org/api-reference/events)
  - [Database schema](https://developer.matomo.org/guides/persistence-and-the-mysql-backend)
- [Email Reports](https://matomo.org/docs/email-reports/)

## Code Snippets

- [Environment Variables](https://github.com/matomo-org/matomo/blob/5ae8668181ff6e622a290df6321c006ef30284e1/plugins/Installation/FormDatabaseSetup.php#L84-L99)

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
  -e MYSQL_ROOT_PASSWORD='root' \
  -e MYSQL_USER='matomo' \
  -e MYSQL_PASSWORD='matomo' \
  -e MYSQL_DATABASE='matomo_dev' \
  -v matomo-mysql-data:/var/lib/mysql \
  -p 3306:3306 \
  --name matomo-mysql \
  --network workbench \
  docker.io/library/mysql:5.7.19
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h matomo \
  -e MATOMO_DATABASE_HOST='matomo-mysql' \
  -e MATOMO_DATABASE_USERNAME='matomo' \
  -e MATOMO_DATABASE_PASSWORD='matomo' \
  -e MATOMO_DATABASE_ADAPTER='MYSQLI' \
  -e MATOMO_DATABASE_DBNAME='matomo_dev' \
  -e MATOMO_DATABASE_TABLES_PREFIX='matomodev_' \
  -v matomo-data:/var/www/html \
  -p 9000:9000 \
  --name matomo \
  --network workbench \
  docker.io/library/matomo:3.14.1-fpm-alpine
```

#### SSL

##### With

```sh
sudo install -dm 755 -o "$USER" -g staff /etc/ssl/certs/matomo.local
mkdir -p /etc/ssl/certs/matomo.local/{ca,server,client}

CAROOT=/etc/ssl/certs/matomo.local/ca \
  mkcert -install

CAROOT=/etc/ssl/certs/matomo.local/ca \
  mkcert \
    -cert-file /etc/ssl/certs/matomo.local/server/server.pem \
    -key-file /etc/ssl/certs/matomo.local/server/server.key \
    matomo.local \
    $(ip route get 1 | awk '{print $NF;exit}') \
    '*.matomo.local' \
    localhost \
    127.0.0.1 \
    ::1
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h nginx \
  -v /private/etc/ssl/certs/matomo.local/server:/etc/nginx/certs \
  -v matomo-nginx-conf:/etc/nginx/conf.d \
  -v matomo-data:/var/www/html \
  -p 8443:443 \
  --name matomo-nginx \
  --network workbench \
  docker.io/library/nginx:1.17.5-alpine
```

```sh
docker exec -i matomo-nginx /bin/sh << \EOSHELL
cat << \EOF > /etc/nginx/conf.d/matomo.conf
upstream php-handler {
    server matomo:9000;
}

server {
    listen 443 ssl;
    root /var/www/html;
    index index.php index.html;

    ssl_certificate /etc/nginx/certs/server.pem;
    ssl_certificate_key /etc/nginx/certs/server.key;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        fastcgi_pass php-handler;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location = /health-check {
        access_log off;
        default_type application/json;
        return 200 '{"status": "ok"}';
    }
}

EOF
EOSHELL
```

```sh
docker restart matomo-nginx
```

```sh
# Health check
curl -ik 'https://127.0.0.1:8443/health-check'

# Open
echo -e '[INFO]\thttps://127.0.0.1:8443'
```

##### Without

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h nginx \
  -v matomo-nginx-conf:/etc/nginx/conf.d \
  -v matomo-data:/var/www/html \
  -p 8080:80 \
  --name matomo-nginx \
  --network workbench \
  docker.io/library/nginx:1.17.5-alpine
```

```sh
docker exec -i matomo-nginx /bin/sh << \EOSHELL
cat << \EOF > /etc/nginx/conf.d/matomo.conf
upstream php-handler {
    server matomo:9000;
}

server {
    listen 80 default_server;
    root /var/www/html;
    index index.php index.html;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        fastcgi_pass php-handler;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location = /health-check {
        access_log off;
        default_type application/json;
        return 200 '{"status": "ok"}';
    }
}

EOF
EOSHELL
```

```sh
docker restart matomo-nginx
```

```sh
# Health check
curl -ik 'http://127.0.0.1:8080/health-check'

# Open
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

####

1. Welcome! -> Next
2. System Check -> Next
3. Database Setup -> Next
4. Creating the Tables -> Next
5. Super User
   - Super user login: `admin`
   - Password and Password (repeat): `Pa$$w0rd!`
   - Email: `admin@matomo.local`
   - Next
6. Setup a Website
   - Website name: `Example`
   - Website URL: `http://matomo.local`
   - Website time zone:
   - Next
7. Tracking code for Example -> Next
8. Congratulations -> Continue to Matomo

```sh
docker exec -i matomo ./console config:set \
  --section='General' \
  --key='enable_trusted_host_check' \
  --value='0'
```

<!-- ```sh
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -D matomo_dev \
  -u matomo \
  -p'matomo' \
  -ve 'SELECT LAST_INSERT_ID();'
``` -->

<!-- ```sh
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -u matomo \
  -p'matomo' \
  -v <<-EOSQL
select
    table_schema,
    table_name,
    max_time
from
    information_schema.tables t1
    JOIN (
        select
            MAX(t2.create_time) AS max_time
        FROM
            information_schema.tables t2
        where
            table_schema = 'test'
    ) as t3 on t1.create_time = t3.max_time;
EOSQL
``` -->

```sh
docker exec -i matomo ./console core:archive \
  --url 'https://127.0.0.1:8443' \
  --force-idsites 1
```

### Database

```sh
# Backup
mysqldump \
  -h 127.0.0.1 \
  -P 3306 \
  -u matomo \
  -p'matomo' \
  matomo_dev \
  > /path/to/dump/matomo-$(gdate +%Y-%m-%d-%H-%M).sql

# Restore
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -u root \
  -p'root' \
  matomo_dev \
  < /path/to/dump/matomo-$(gdate +%Y-%m-%d-%H-%M).sql
```

### State

```sh
#
docker stop matomo-mysql matomo matomo-nginx

#
docker start matomo-mysql matomo matomo-nginx
```

### Remove

```sh
docker rm -f matomo-mysql matomo matomo-nginx

docker volume rm matomo-mysql-data matomo-data matomo-nginx-conf

docker network rm workbench
```

## Kubernetes

### Running

```sh
kubectl create namespace matomo
```

```sh
cat << \EOF | kubectl apply -f -
apiVersion: v1
kind: ConfigMap
metadata:
  name: nginx-config
  namespace: matomo
  labels:
    app: matomo
data:
  nginx.conf: |
    user  nginx;
    worker_processes  auto;

    error_log  /var/log/nginx/error.log warn;
    pid        /var/run/nginx.pid;


    events {
        worker_connections  1024;
    }


    http {
        include       /etc/nginx/mime.types;
        default_type  application/octet-stream;

        log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                          '$status $body_bytes_sent "$http_referer" '
                          '"$http_user_agent" "$http_x_forwarded_for"';

        access_log  /var/log/nginx/access.log  main;

        sendfile        on;
        #tcp_nopush     on;

        keepalive_timeout  65;

        #gzip  on;

        include /etc/nginx/conf.d/*.conf;
    }

  matomo.conf: |
    upstream php-handler {
        server localhost:9000;
    }

    server {
        listen 80 default_server;
        root /var/www/html;
        index index.php index.html;

        location / {
            try_files $uri $uri/ =404;
        }

        location ~ \.php$ {
            fastcgi_pass php-handler;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
            include fastcgi_params;
        }

        location = /health-check {
            access_log off;
            default_type application/json;
            return 200 '{"status": "ok"}';
        }
    }

EOF
```

```sh
cat << \EOF | kubectl apply -f -
apiVersion: v1
kind: ConfigMap
metadata:
  name: matomo-config
  namespace: matomo
  labels:
    app: matomo
data:
  www.conf: |
    [www]
    user = www-data
    group = www-data

    listen = 127.0.0.1:9000

    pm = dynamic
    pm.max_children = 5
    pm.start_servers = 2
    pm.min_spare_servers = 1
    pm.max_spare_servers = 3
    pm.status_path = /status

EOF
```

```sh
cat << EOF | kubectl apply -f -
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: matomo
  namespace: matomo
  labels:
    app: matomo
spec:
  accessModes:
  - ReadWriteOnce
  resources:
    requests:
      storage: 10Gi
  storageClassName:

EOF
```

```sh
cat << EOF | kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: matomo
  namespace: matomo
  labels:
    app: matomo
spec:
  selector:
    matchLabels:
      app: matomo
  replicas: 1
  template:
    metadata:
      labels:
        app: matomo
    spec:
      containers:
      - name: nginx
        image: docker.io/library/nginx:1.17.5-alpine
        ports:
        - containerPort: 80
        volumeMounts:
        - name: nginx-config
          mountPath: /etc/nginx/nginx.conf
          subPath: nginx.conf
        - name: nginx-config
          mountPath: /etc/nginx/conf.d/matomo.conf
          subPath: matomo.conf
        - name: matomo-volume
          mountPath: /var/www/html
          subPath: html
      - name: matomo
        image: docker.io/library/matomo:3.13.3-fpm-alpine
        ports:
        - containerPort: 9000
        volumeMounts:
        - name: matomo-config
          mountPath: /usr/local/etc/php-fpm.d/www.conf
          subPath: www.conf
        - name: matomo-volume
          mountPath: /var/www/html
          subPath: html
      volumes:
      - name: matomo-volume
        persistentVolumeClaim:
          claimName: matomo
      - name: nginx-config
        configMap:
          name: nginx-config
          items:
          - key: nginx.conf
            path: nginx.conf
            mode: 292
          - key: matomo.conf
            path: matomo.conf
            mode: 292
      - name: matomo-config
        configMap:
          name: matomo-config
          items:
          - key: www.conf
            path: www.conf
            mode: 292

EOF
```

```sh
cat << EOF | kubectl apply -f -
apiVersion: v1
kind: Service
metadata:
  name: nginx
  namespace: matomo
  labels:
    app: matomo
spec:
  selector:
    app: matomo
  ports:
  - name: fpm
    port: 80

EOF
```

```sh
#
minikube tunnel

#
cgi-fcgi -bind -connect 'matomo.matomo.svc.cluster.local:9000'

#
SCRIPT_NAME=/status \
  SCRIPT_FILENAME=/status \
  QUERY_STRING= \
  REQUEST_METHOD=GET \
  cgi-fcgi -bind -connect 'matomo.matomo.svc.cluster.local:9000'; echo
```

```sh
kubectl exec -it \
  $(kubectl get pod -l 'app=matomo' -o jsonpath='{.items[0].metadata.name}' -n matomo) \
  -c matomo \
  -n matomo \
  -- ls /var/www/html

kubectl exec -it \
  $(kubectl get pod -l 'app=matomo' -o jsonpath='{.items[0].metadata.name}' -n matomo) \
  -c nginx \
  -n matomo \
  -- ls /var/www/html

kubectl exec -it \
  $(kubectl get pod -l 'app=matomo' -o jsonpath='{.items[0].metadata.name}' -n matomo) \
  -c nginx \
  -n matomo \
  -- cat /etc/nginx/{nginx.conf,conf.d/matomo.conf}
```

```sh
cat << EOF | kubectl apply -f -
apiVersion: v1
kind: Service
metadata:
  name: matomo
  namespace: matomo
  labels:
    app: matomo
spec:
  selector:
    app: matomo
  ports:
  - name: http
    port: 9000

EOF
```

```sh
cat << EOF | kubectl apply -f -
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: matomo
  namespace: matomo
  labels:
    app: matomo
spec:
  rules:
  - host: matomo.$(minikube ip).nip.io
    http:
      paths:
      - backend:
          serviceName: nginx
          servicePort: 80
        path: /

EOF
```

```sh
kubectl get all -n matomo
kubectl get ingress -n matomo
```

```sh
echo -e "[INFO]\thttp://matomo.$(minikube ip).nip.io"
```

```sh
helm install stable/mysql \
  -n mysql \
  --namespace matomo \
  --set mysqlUser=matomo \
  --set mysqlPassword=matomo \
  --set mysqlDatabase=matomo
```

| Field | Value |
| --- | --- |
| Database Server | `mysql.matomo.svc.cluster.local` |
| Login  | `matomo` |
| Password | `matomo` |
| Database Name | `matomo` |

### Delete

```sh
kubectl delete namespace matomo --grace-period=0 --force
```

## Helm

### References

- [Configuration](https://github.com/brunowego/matomo-helm#configuration)

### Install

```sh
kubectl create namespace matomo
```

```sh
# helm install stable/matomo \
helm install ./ \
  -n matomo \
  --namespace matomo \
  --set ingress.enabled=true \
  --set "ingress.hosts[0].host=matomo.$(minikube ip).nip.io" \
  --set 'ingress.hosts[0].paths={/}'
```

### SSL

#### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

#### Create

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n matomo
```

```sh
helm upgrade matomo stable/matomo -f <(yq m <(cat << EOF
ingress:
  tls:
    - secretName: example.tls-secret
      hosts:
        - matomo.$(minikube ip).nip.io
EOF
) <(helm get values matomo))
```

#### Remove

```sh
helm upgrade matomo stable/matomo -f <(yq d <(helm get values matomo) ingress.tls)

kubectl delete secret example.tls-secret -n matomo
```

### Status

```sh
kubectl rollout status deploy/matomo -n matomo
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=matomo' \
  -c matomo \
  -n matomo \
  -f
```

### DNS

```sh
dig @10.96.0.10 matomo.matomo.svc.cluster.local +short
nslookup matomo.matomo.svc.cluster.local 10.96.0.10
```

#### ExternalDNS

```sh
dig @10.96.0.10 "matomo.$(minikube ip).nip.io" +short
nslookup "matomo.$(minikube ip).nip.io" 10.96.0.10
```

### Secret

```sh
kubectl get secret matomo \
  -o jsonpath='{.data.admin-password}' \
  -n matomo | \
    base64 --decode; echo
```

### Delete

```sh
helm delete matomo --purge
kubectl delete namespace matomo --grace-period=0 --force
```

## Host

### Dependencies

- [GNU Wget](/gnu_wget.md)
- [PHP](/php.md) and [PHP-FPM](/php-fpm#configuration)
- [GNU time](/gnu_time.md)
- [MySQL](/mysql.md)
- [Apache HTTP Server (HTTPd)](/apache_httpd.md) or [NGINX](/nginx.md)

### Installation

For old versions change `matomo` to `piwik`.

```sh
# Desired version
export MATOMO_VERSION=3.13.3
```

#### Darwin

```sh
# Create folder
sudo install -dm 775 -o "$USER" -g admin "/var/www/matomo-$MATOMO_VERSION"

# Download
wget -O - "https://builds.matomo.org/matomo-$MATOMO_VERSION.tar.gz" | \
  tar \
    -xzC '/var/www' \
    --no-same-owner \
    --no-same-permissions \
    --transform "s/matomo/matomo-$MATOMO_VERSION/" \
    matomo
```

```sh
sudo ln -s "/var/www/matomo-$MATOMO_VERSION" '/var/www/html' && \
  sudo chown -h "$USER":admin "$_"
```

#### Linux

```sh
# Create folder
sudo install -dm 775 -o "$(id -u)" -g "$(id -g)" "/var/www/matomo-$MATOMO_VERSION"

# Download
wget -O - "https://builds.matomo.org/matomo-$MATOMO_VERSION.tar.gz" | \
  sudo -u "$USER" tar \
    -xzC '/var/www' \
    --no-same-owner \
    --no-same-permissions \
    --transform "s/matomo/matomo-$MATOMO_VERSION/" \
    matomo
```

```sh
sudo ln -s "/var/www/matomo-$MATOMO_VERSION" '/var/www/html' && \
  sudo chown -h "$USER": "$_"
```

#### Git

```sh
git clone \
  --branch "$MATOMO_VERSION" \
  --single-branch \
  --depth 1 \
  https://github.com/matomo-org/matomo.git \
  matomo && \
    cd "$_"
```

```sh
git submodule init
git submodule update || true
```

```sh
composer self-update
composer install
```

### Running

#### Dependencies

##### MySQL

###### Docker

```sh
# Remove MySQL container and volume if exists
docker rm -f matomo-mysql
docker volume rm mysql-data

# Run MySQL
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h matomo-mysql \
  -e MYSQL_ROOT_PASSWORD='root' \
  -e MYSQL_USER='matomo' \
  -e MYSQL_PASSWORD='matomo' \
  -e MYSQL_DATABASE='matomo_dev' \
  -v matomo-mysql-data:/var/lib/mysql \
  -p 3306:3306 \
  --name matomo-mysql \
  docker.io/library/mysql:5.7
```

```sh
docker exec -i matomo-mysql /bin/sh << EOSHELL
cat << EOF > /etc/mysql/conf.d/increase.cnf
[mysqld]
max_allowed_packet = 128M

EOF
EOSHELL
```

```sh
docker restart matomo-mysql
```

###### Host

```sh
mysql -u root -p'root' -v <<-\EOSQL
CREATE DATABASE IF NOT EXISTS matomo_dev
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci
EOSQL
```

```sh
mysql -u root -p'root' -v <<-\EOSQL
CREATE USER IF NOT EXISTS 'matomo'@'localhost'
  IDENTIFIED BY 'matomo';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, ALTER, CREATE TEMPORARY TABLES, LOCK TABLES ON *.*
  TO 'matomo'@'localhost';

GRANT FILE ON *.*
  TO 'matomo'@'localhost';
EOSQL
```

```sh
# Darwin
echo 'max_allowed_packet = 128M' >> /usr/local/etc/my.cnf

# Linux
cat << EOF > /etc/mysql/conf.d/increase.cnf
[mysqld]
max_allowed_packet = 128M

EOF
```

```sh
# Homebrew
## 5.7
brew services restart mysql@5.7

## 8.x
brew services restart mysql
```

#### PHP Server

```sh
#
cd /path/to/matomo

# Remove matomo configuration if exists
rm ./config/config.ini.php
```

```sh
export \
  MATOMO_DATABASE_HOST='127.0.0.1' \
  MATOMO_DATABASE_USERNAME='matomo' \
  MATOMO_DATABASE_PASSWORD='matomo' \
  MATOMO_DATABASE_DBNAME='matomo_dev' \
  MATOMO_DATABASE_TABLES_PREFIX='matomodev_'

# PHPBrew
phpbrew switch [version]-fpm-dev

#
php -r 'print_r(get_defined_vars()["_SERVER"]);' | grep MATOMO_
```

```sh
# Using built in PHP Server
# Start Server
nohup php -d memory_limit=8G -S 127.0.0.1:8080 &

# Tail Server
tail -f ./nohup.out

# Or, Using PHP-FPM

# Start PHP-FPM
phpbrew fpm start
phpbrew fpm current

# Test
cgi-fcgi -bind -connect '127.0.0.1:9000'

ulimit -n 8192

#
sudo install -dm 775 -o "$USER" -g staff /etc/ssl/certs/matomo.local
mkdir -p /etc/ssl/certs/matomo.local/{ca,server,client}

CAROOT=/etc/ssl/certs/matomo.local/ca \
  mkcert -install

CAROOT=/etc/ssl/certs/matomo.local/ca \
  mkcert \
    -cert-file /etc/ssl/certs/matomo.local/server/server.pem \
    -key-file /etc/ssl/certs/matomo.local/server/server.key \
    matomo.local \
    '*.matomo.local' \
    localhost \
    127.0.0.1 \
    ::1

# FastCGI Proxy
caddy -conf <(cat << EOF
:8443 {
  root $PWD

  fastcgi / 127.0.0.1:9000 php {
    index index.php
  }

  tls /etc/ssl/certs/matomo.local/server/server.pem /etc/ssl/certs/matomo.local/server/server.key
  gzip
}
EOF
)

#
pkill caddy
```

```sh
# HTTP
xdg-open 'http://127.0.0.1:8080' || open 'http://127.0.0.1:8080' || echo -e '[INFO]\thttp://127.0.0.1:8080'

# HTTPS
xdg-open 'https://127.0.0.1:8443' || open 'https://127.0.0.1:8443' || echo -e '[INFO]\thttps://127.0.0.1:8443'
```

### Configuration

```sh
# Disable trusted host check
./console config:set \
  --section='General' \
  --key='enable_trusted_host_check' \
  --value='0'

#
./console config:set 'General.enable_browser_archiving_triggering=0'

#
## HTTP
gtime -v ./console core:archive \
  --url http://127.0.0.1:8080 \
  --force-idsites 1

## HTTPS
gtime -v ./console core:archive \
  --url https://127.0.0.1:8443 \
  --force-idsites 1

#
./console diagnostics:analyze-archive-table $(gdate +%Y_%m)

#
postkid -run-curl <(cat << EOF
method: GET
host: https://127.0.0.1:8080
path: matomo.php
query:
  idsite: 1
  rec: 1
  action_name: Home Page
  url: http://matomo.local
  _id: $(openssl rand -hex 16)
  rand: $(head -200 /dev/urandom | cksum | cut -f 1 -d ' ')
  apiv: 1
header:
  Origin: http://matomo.local
  Content-Type: application/json
EOF
)
```

```sh
# Kill Server
pkill php

# Or
kill -9 "$(lsof -nPi tcp:8080 | grep LISTEN | awk '{print $2}')"

kill -9 "$(lsof -nPi tcp:8443 | grep LISTEN | awk '{print $2}')"
```

#### Log

```sh
./console config:set \
  'log.log_writers[]="file"' \
  'log.log_level="DEBUG"'
```

#### Cache

##### Redis

```sh
# Remove Redis container and volume if exists
docker rm -f matomo-redis
docker volume rm redis-data

# Run Redis
docker run -d \
  -h matomo-redis \
  -e REDIS_PASSWORD=redis \
  -v redis-data:/data \
  -p 6379:6379 \
  --name matomo-redis \
  docker.io/library/redis:5.0.5-alpine3.9 /bin/sh -c 'redis-server --appendonly yes --requirepass ${REDIS_PASSWORD}'
```

```sh
./console config:set \
  'RedisCache.host="127.0.0.1"' \
  'RedisCache.port=6379' \
  'RedisCache.password="redis"' \
  'RedisCache.database=14' \
  'RedisCache.timeout="0.0"'

./console config:set 'Cache.backend="redis"'
```

##### Chained

```sh
./console config:set \
  'ChainedCache.backends[]="array"' \
  'ChainedCache.backends[]="redis"'

./console config:set 'Cache.backend="chained"'
```

#### Debug

```sh
./console config:set \
  'Debug.always_archive_data_period=1' \
  'Debug.always_archive_data_day=1' \
  'Debug.always_archive_data_range=1'

./console config:set 'Debug.enable_sql_profiler=1'

./console config:set 'Debug.tracker_always_new_visitor=1'

./console config:set 'Debug.log_sql_queries=1'

# ./console config:set \
#   'Debug.archiving_profile=1' \
#   'Debug.archive_profiling_log="/tmp"'
```

#### General

```sh
./console config:set \
  'General.enable_processing_unique_visitors_year=1' \
  'General.enable_processing_unique_visitors_range=1'
  'General.enable_processing_unique_visitors_multiple_sites=1'

./console config:set 'General.enable_segments_subquery_cache=1' \

# Disable Browser Archiving
## General settings -> System -> General settings -> Archiving settings
./console config:set \
  'General.browser_archiving_disabled_enforce=1' \
  'General.time_before_today_archive_considered_outdated=86400' \
  'General.enable_browser_archiving_triggering=0' \
  'General.archiving_range_force_on_browser_request=0'

./console config:set \
  'General.live_widget_refresh_after_seconds=300' \
  'General.live_widget_visitor_count_last_minutes=30'

./console config:set 'General.enable_sql_optimize_queries=0'

./console config:set 'General.enable_internet_features=0'

./console config:set 'General.enable_plugin_upload=1'

./console config:set \
  'General.show_update_notification_to_superusers_only=1' \
  'General.enable_auto_update=0' \
  'General.enable_update_communication=0'
```

### Performance

- Conversion is: Byte to Mebibyte

```sh
mysql -u root -p -ve 'SHOW ENGINE INNODB STATUS'

mysql -u root -p -ve 'SHOW GLOBAL STATUS LIKE "%innodb%"'

mysql -u root -p -ve 'SELECT @@innodb_buffer_pool_size/1024/1024/1024'
mysql -u root -p -ve 'SELECT @@innodb_buffer_pool_instances'
```

```sh
cat << EOF >> /usr/local/etc/my.cnf
max_connections = 1000
max_connect_errors = 10
table_open_cache = 8192
max_allowed_packet = 128M
max_heap_table_size = 512M
read_buffer_size = 8M
read_rnd_buffer_size = 64M
sort_buffer_size = 32M
join_buffer_size = 32M
thread_cache_size = 200
query_cache_size = 256M
query_cache_limit = 8M
thread_stack = 512K
tmp_table_size = 1G

innodb_buffer_pool_size = 8G
innodb_data_file_path = ibdata1:12M:autoextend
innodb_write_io_threads = 16
innodb_read_io_threads = 16

innodb_thread_concurrency = 32
innodb_flush_log_at_trx_commit = 2
innodb_log_buffer_size = 32M
innodb_log_file_size = 512M
innodb_log_files_in_group = 4
innodb_max_dirty_pages_pct = 90
innodb_lock_wait_timeout = 50

explicit_defaults_for_timestamp = 1
innodb_file_per_table = 1
innodb_flush_method = O_DIRECT
innodb_buffer_pool_instances = 8
innodb_read_ahead_threshold = 0
innodb_io_capacity = 20000

sql_mode = NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES

[mysqldump]
quick
max_allowed_packet = 16M

[mysqld_safe]
open-files-limit = 16384
EOF
```

### Database

```sh
# Backup
mysqldump \
  -h 127.0.0.1 \
  -P 3306 \
  -u matomo \
  -p'matomo' \
  matomo_dev \
  > ./tmp/matomo-$(gdate +%Y-%m-%d-%H-%M).sql

# Restore
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -u matomo \
  -p'matomo' \
  matomo_dev \
  < /tmp/matomo.sql
```

### Plugins

```sh
./console plugin:deactivate Marketplace
```

### Usage

```sh
# Commands
./console list

# Development Mode
./console development:enable

# Core Update
./console core:update --yes

# Core Archiver
## Help
./console help core:archive \
  --url http://127.0.0.1:8000

## Simple
gtime -v ./console core:archive \
  --url http://127.0.0.1:8080 \
  --force-idsites 1
```

```sh
# Memory Improved
php -i | grep memory_limit # 128M
php -d memory_limit=8G -i | grep memory_limit

gtime -v php \
  -d memory_limit=8G \
  ./console core:archive \
    --url http://127.0.0.1:8080 \
    --force-idsites 1 \
    --php-cli-options='-d memory_limit=8G'
```

Install and active [Visitor Generator](/matomo-visitor-generator.md).

```sh
# Generate dummy data
gtime -v ./console visitorgenerator:generate-visits \
  --idsite 1 \
  --days 7 \
  --custom-piwik-url http://127.0.0.1:8080
```

```sh
# Periods
gtime -v php \
  -d memory_limit=8G \
  ./console core:archive \
    --url http://127.0.0.1:8080 \
    --force-idsites 1 \
    --force-periods='day,week' \
    --php-cli-options='-d memory_limit=8G'
```

```sh
gtime -v ./console core:invalidate-report-data \
  --dates "$(gdate -d '1 week ago' +%Y-%m-%d),$(gdate +%Y-%m-%d)" \
  --sites 1 \
  --periods day,week
```

```sh
# All Periods
gtime -v php \
  -d memory_limit=8G \
  ./console core:archive \
    --url http://127.0.0.1:8080 \
    --force-all-websites \
    --force-all-periods='315576000' \
    --force-date-last-n='1000' \
    --concurrent-requests-per-website='8' \
    --php-cli-options='-d memory_limit=8G'
```

### Tips

#### Apache HTTP Server Configuration

```sh
# Darwin
sed -i 's/[[:space:]]*DirectoryIndex/& index.php/' /usr/local/etc/httpd/httpd.conf
```

```sh
# Linux
cat << EOF | sudo tee /etc/httpd/conf.d/matomo.conf
DocumentRoot "/path/to/matomo"

<Directory "/path/to">
    AllowOverride None
    Require all granted
</Directory>

<Directory "/path/to/matomo">
    Options Indexes FollowSymLinks
    AllowOverride None
    Require all granted
</Directory>
EOF
```

```sh
# Homebrew
brew services restart httpd

# Systemd
sudo systemctl restart httpd

# Test
httpd -t
```

#### NGINX Configuration

```sh
# PHPBrew
phpbrew fpm current
```

```sh
# Linux
cat << \EOF | sudo tee /etc/nginx/conf.d/matomo.conf
upstream php-handler {
    server 127.0.0.1:9000;
}

server {
    listen 8080 default_server;
    root /var/www/html;
    index index.php index.html;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        fastcgi_pass php-handler;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location = /health-check {
        access_log off;
        default_type application/json;
        return 200 '{"status": "ok"}';
    }
}

EOF
```

> **Darwin**: Different path to `matomo.conf`. Change to `/usr/local/etc/nginx/servers/matomo.conf`.

```sh
# Homebrew
brew services restart nginx

# Systemd
sudo systemctl restart nginx

# Test
sudo nginx -t
```

#### Get Version

```sh
# Using CLI
./console -V

# Using MySQL Query
mysql -u root -p -v <<-\EOSQL
SELECT option_value
  FROM `matomo_dev`.`matomodev_option`
  WHERE `option_name` = 'version_core'
EOSQL
```

- Change database and table name for Piwik

<!-- #### Get Last Visit

```sh
mysql -u root -p -v <<-\EOSQL
SELECT `name`, `value`
FROM `matomo`.`piwik_sequence`
WHERE `value` >= 10000
EOSQL
``` -->

#### Add Admin User

```sh
# Piwik
mysql -u root -p -v <<-\EOSQL
INSERT INTO `piwik`.`piwik_user`
  VALUES ('admin', '$2y$10$h1t8GSqIIwM.WU3BE.LUQO63RqT2So5eMlgD5mVXzqn0OhWeudol6', 'admin', 'admin@matomo.local', '35d110c758bfbbac03cdca6351fdfe85', 1, '2019-11-04 12:13:24')
EOSQL

# Matomo
mysql -u root -p -v <<-\EOSQL
INSERT INTO `matomo`.`matomodev_user`
  VALUES ('admin', '$2y$10$h1t8GSqIIwM.WU3BE.LUQO63RqT2So5eMlgD5mVXzqn0OhWeudol6', 'admin', 'admin@matomo.local', '', '35d110c758bfbbac03cdca6351fdfe85', 1, '2019-11-04 12:13:24', '2019-11-04 12:13:24')
EOSQL
```

- Change database and table name for Piwik
- Remove last date for Piwik.

| Username | Password |
| --- | --- |
| `admin` | `Pa$$w0rd!` |

### Issues

#### Running User

```log
Matomo couldn't write to some directories (running as user '[username]').
```

```sh
# PHPBrew
phpbrew fpm current

#
sudo usermod -aG nginx "$USER" && sudo su - "$USER"

#
sudo rm -fR "/var/www/matomo-$MATOMO_VERSION/tmp"
```

#### Slow Memory

```log
ERROR [2019-11-09 19:59:51] Got invalid response from API request: ?module=API&method=API.get&idSite=16&period=year&date=last7&format=php&trigger=archivephp. Response was 'PHP Fatal error:  Allowed memory size of 805306368 bytes exhausted (tried to allocate 20480 bytes) in /usr/local/src/piwik/core/DataTable/Row.php on line 69  Fatal error: Allowed memory size of 805306368 bytes exhausted (tried to allocate 20480 bytes) in /usr/local/src/piwik/core/DataTable/Row.php on line 69 PHP Fatal error:  Allowed memory size of 805306368 bytes exhausted (tried to allocate 32768 bytes) in /usr/local/src/piwik/core/Http.php on line 615  Fatal error: Allowed memory size of 805306368 bytes exhausted (tried to allocate 32768 bytes) in /usr/local/src/piwik/core/Http.php on line 615 '
```

Try run with PHP ini entry `memory_limit=8G`.

#### PHP Syntax Error

```log
SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '. piwik_log_visit' at line 1
```

Solution for this issue [here](https://github.com/matomo-org/matomo/pull/12759).

### Uninstall

```sh
# Darwin
rm -fR /usr/local/src/matomo

# Linux
rm -fR /usr/src/matomo
```

## Docs

### Email Settings

1. Adminstration
2. System
3. General settings
4. Email server settings
   - Check: Use SMTP server for e-mail
   - SMTP server address: `smtp.gmail.com`
   - SMTP Port: `587`
   - Authentication method for SMTP: `Login`
   - SMTP username: `[username]@gmail.com`
   - SMTP password: `[password]`
   - SMTP from name: `Matomo`
   - SMTP encryption: `TLS`

### Email Reports

1. Adminstration
2. Personal
3. Email Reports -> Personal Email Reports -> Create and Schedule a report
4. Create and Schedule a report
   - Description: Daily Goal
   - Choose a segment: (Select) All visits
   - Email Schedule: Daily
   - Send report at X o'clock: 12
   - Statistics included: Select as you wish
   - Create Report
