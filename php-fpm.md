# PHP FastCGI Process Manager (FPM)

<!--
https://geekflare.com/php-fpm-optimization/
https://medium.com/@sbuckpesch/apache2-and-php-fpm-performance-optimization-step-by-step-guide-1bfecf161534
https://www.webfoobar.com/node/64
-->

## Kubernetes

### Running

```sh
kubectl create namespace php-fpm
```

```sh
cat << \EOF | kubectl apply -f -
apiVersion: v1
kind: ConfigMap
metadata:
  name: php-fpm-config
  namespace: php-fpm
  labels:
    app: php-fpm
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
apiVersion: apps/v1
kind: Deployment
metadata:
  name: php-fpm
  namespace: php-fpm
  labels:
    app: php-fpm
spec:
  selector:
    matchLabels:
      app: php-fpm
  replicas: 1
  template:
    metadata:
      labels:
        app: php-fpm
    spec:
      containers:
      - name: php-fpm
        image: docker.io/library/php:7.3-fpm-alpine
        ports:
        - containerPort: 9000
        volumeMounts:
        - name: php-fpm-config
          mountPath: /usr/local/etc/php-fpm.d/www.conf
          subPath: www.conf
      volumes:
      - name: php-fpm-config
        configMap:
          name: php-fpm-config
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
  name: php-fpm
  namespace: php-fpm
  labels:
    app: php-fpm
spec:
  selector:
    app: php-fpm
  ports:
  - name: fpm
    port: 9000

EOF
```

```sh
kubectl get all -n php-fpm
```

```sh
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
# Helm
helm upgrade nginx-ingress stable/nginx-ingress -f <(yq w <(helm get values nginx-ingress) tcp.9000 php-fpm/php-fpm:9000)

## Delete
# TODO

# Minikube
kubectl patch configmap tcp-services \
  -p '{"data":{"9000":"php-fpm/php-fpm:9000"}}' \
  -n kube-system

kubectl patch deployment nginx-ingress-controller \
  --type 'json' \
  -p '[{"op": "add", "path": "/spec/template/spec/containers/0/ports", "value": [{"hostPort": 9000, "containerPort": 9000}]}]' \
  -n kube-system

## Delete
kubectl patch configmap tcp-services \
  --type 'json' \
  -p '[{"op": "remove", "path": "/data/9000"}]' \
  -n kube-system

kubectl patch deployment nginx-ingress-controller \
  --type 'json' \
  -p '[{"op": "remove", "path": "/spec/template/spec/containers/0/ports", "value": [{"hostPort": 9000, "containerPort": 9000}]}]' \
  -n kube-system
```

```sh
cgi-fcgi -bind -connect "$(minikube ip):9000"
```

### Delete

```sh
kubectl delete namespace php-fpm --grace-period=0 --force
```

## Docker

### Dependencies

- [FastCGI](/cgi-fcgi.md)

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h php-fpm \
  -p 9000:9000 \
  --name php-fpm \
  docker.io/library/php:7.3-fpm-alpine
```

```sh
cgi-fcgi -bind -connect 127.0.0.1:9000
```

### Remove

```sh
docker rm -f php-fpm
```

## CLI

### Dependencies

- [CentOS Repo's](/centos.md#repositories)
- [NGINX](/nginx.md)
- [PHPBrew](/phpbrew.md)

### Installation

#### 5.x

##### YUM

```sh
yum check-update
sudo yum -y install php-fpm
```

#### 7.x

##### Homebrew

```sh
brew install php
```

##### YUM

```sh
yum check-update

# Repo: Software Collections
sudo yum -y install rh-php72-php-fpm
scl enable rh-php72 "$SHELL"
sudo /usr/bin/sh -c 'echo "source scl_source enable rh-php72" >> /etc/profile.d/scl.sh'
```

##### APT

```sh
sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt -y install php-fpm
```

#### Source

##### Dependencies

###### YUM

```sh
yum check-update
sudo yum -y install gcc libxml2-devel bzip2-devel openssl-devel make
```

##### Build & Install

```sh
export PHP_VERSION=7.3.13

sudo mkdir -p /usr/src/php

# cURL
curl -L https://php.net/distributions/php-$PHP_VERSION.tar.gz | sudo tar -xzC /usr/src/php --transform s/php-//

# GNU Wget
wget -O - https://php.net/distributions/php-$PHP_VERSION.tar.gz | tar -xzC /usr/src/php --transform s/php-//

( cd /usr/src/php/$PHP_VERSION && sudo ./configure --enable-fpm --with-fpm-systemd --with-openssl --with-bz2 && sudo make && sudo make install )

# PHP File Configuration
sudo cp /usr/src/php/$PHP_VERSION/php.ini-development /usr/local/lib/php.ini

# Or
sudo cp /usr/src/php/$PHP_VERSION/php.ini-production /usr/local/lib/php.ini

echo "$(php -i | grep -oE /.+/php.ini)"

#
sudo cp /usr/local/etc/php-fpm.conf.default /usr/local/etc/php-fpm.conf

#
sed -i 's/;\(pid =\)/\1/g' /usr/local/etc/php-fpm.conf
sed -i 's/NONE\///g' /usr/local/etc/php-fpm.conf

php-fpm -t

#
sudo cp /usr/local/etc/php-fpm.d/www.conf.default /usr/local/etc/php-fpm.d/www.conf

#
sudo cp /usr/src/php/$PHP_VERSION/sapi/fpm/php-fpm.service /usr/lib/systemd/system

#
tail -f /usr/local/var/log/php-fpm.log

#
lsof -i :9000

journalctl -xe

journalctl -e -u php-fpm -n 8

groupadd -g 666 www
useradd -u 666 -g 666 www

# yum -y install mod_fastcgi

httpd -tD DUMP_MODULES
```

### Services

```sh
# Linux Default
sudo systemctl enable --now php-fpm

# PHPBrew
phpbrew fpm start

# YUM (Software Collections)
sudo systemctl enable --now rh-php72-php-fpm

# APT
sudo systemctl enable --now php7.0-fpm
```

### Commands

```sh
php-fpm -h
```

#### PHPBrew

```sh
phpbrew fpm help
```

```sh
phpbrew fpm test
phpbrew fpm module
```

```sh
phpbrew fpm start
phpbrew fpm current
phpbrew fpm restart
phpbrew fpm stop
```

### Configuration

```sh
# locate php-fpm.conf
# locate www.conf

# Default
export PHP_FPM_CONF='/etc/php-fpm.conf'
export PHP_FPM_CONF_DIR='/etc/php-fpm.d'

# PHPBrew
export PHP_FPM_CONF="$(phpbrew path etc)/php-fpm.conf"
export PHP_FPM_CONF_DIR="$(phpbrew path etc)/php-fpm.d"

# YUM (Software Collections)
export PHP_FPM_CONF='/etc/opt/rh/rh-php72/php-fpm.conf'
export PHP_FPM_CONF_DIR='/etc/opt/rh/rh-php72/php-fpm.d'

# APT
export PHP_FPM_CONF='/etc/php/7.2/fpm/php-fpm.conf'
export PHP_FPM_CONF_DIR='/etc/php/7.2/fpm/pool.d'

# Homebrew
export PHP_FPM_CONF="$(brew --prefix)/etc/php/7.3/php-fpm.conf"
export PHP_FPM_CONF_DIR="$(brew --prefix)/etc/php/7.3/php-fpm.d"
```

#### Listen

```sh
sed -i '/^listen = /c listen = 0.0.0.0:9000' "$PHP_FPM_CONF_DIR/www.conf"
```

```sh
# PHPBrew
phpbrew fpm restart
```

#### User and Group

```sh
# Apache HTTP Server (HTTPd)
sed -i '/^user =/ s/nobody/apache/' "$PHP_FPM_CONF_DIR/www.conf"
sed -i '/^group =/ s/nobody/apache/' "$PHP_FPM_CONF_DIR/www.conf"

# NGINX
sed -i '/^user =/ s/nobody/nginx/' "$PHP_FPM_CONF_DIR/www.conf"
sed -i '/^group =/ s/nobody/nginx/' "$PHP_FPM_CONF_DIR/www.conf"
```

```sh
# PHPBrew
phpbrew fpm restart
```

#### Logs

```sh
# PHPBrew
mkdir -p $(dirname $(phpbrew path etc))/log
```

```sh
sudo sed -i '/^;access.log = log\/$pool.access.log/ s/^;//' "$PHP_FPM_CONF_DIR/www.conf"
# sudo sed -i '/^;access.format = .*/ s/^;//' "$PHP_FPM_CONF_DIR/www.conf"

sudo sed -i '/^;slowlog = log\/$pool.log.slow/ s/^;//' "$PHP_FPM_CONF_DIR/www.conf"

sudo sed -i '/^;php_admin_value\[error_log\]/ s/^;//' "$PHP_FPM_CONF_DIR/www.conf"
```

```sh
# PHPBrew
phpbrew fpm restart
```

```sh
tail -f $(dirname $(phpbrew path etc))/log/www.access.log
```

### Test

```sh
# Config
php-fpm -t

# Port
sudo lsof -i :9000

# Process
ps -ef | grep php-fpm

# PHP
php -i | grep '\--enable-fpm'
```

### Tips

#### Improve Memory Limit

| Parameter | Value |
| --- | --- |
| `php_admin_value[memory_limit]` | `8G` |
| `php_value[memory_limit]` | `8G` |

```sh
sudo sed -i '/^;php_admin_value\[memory_limit\]/ s/^;//' "$PHP_FPM_CONF_DIR/www.conf"
sudo sed -i '/^php_value\[session.save_path\] .*/a php_value[memory_limit] = 8G' "$PHP_FPM_CONF_DIR/www.conf"
```

```sh
# PHPBrew
phpbrew fpm restart
```

#### Status Page

```sh
sudo sed -i '/^;pm\.status_path/ s/^;//' "$PHP_FPM_CONF_DIR/www.conf"
sudo sed -i '/^;ping\.path/ s/^;//' "$PHP_FPM_CONF_DIR/www.conf"
```

```sh
# PHPBrew
phpbrew fpm restart
```
