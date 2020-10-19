# WordPress

<!--
https://snipcart.com/blog/reactjs-wordpress-rest-api-example
https://www.freecodecamp.org/news/wordpress-react-how-to-create-a-modern-web-app-using-wordpress-ef6cc6be0cd0/
https://blog.usejournal.com/react-wordpress-rest-api-c6e94595e4d7
https://www.cloudways.com/blog/use-react-with-wordpress-to-create-headless-cms/
https://medium.com/how-to-react/visual-composer-wordpress-rest-api-reactjs-to-create-a-awesome-site-790db78e1e0d
https://pagely.com/blog/react-js-wordpress-rest-api/
-->

## References

- [Dashicons](https://developer.wordpress.org/resource/dashicons/#sort)
- [Function Reference/register post type](https://codex.wordpress.org/Function_Reference/register_post_type)
- [Child Themes and Templates](https://wpadverts.com/documentation/child-themes-and-templates/)
- [Debugging with WordPress and being secure](https://www.damiencarbery.com/2017/01/debugging-with-wordpress-and-being-secure/)

## Scripts

- [WordPress BEM Menu](https://github.com/roryashfordbentley/Wordpress-Bem-Menu)

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/wordpress#configuration)

### Install

```sh
kubectl create namespace wordpress
```

```sh
helm install stable/wordpress \
  -n wordpress \
  --namespace wordpress \
  --set ingress.enabled=true \
  --set "ingress.hosts[0].name=wordpress.$(minikube ip).nip.io" \
  --set 'ingress.hosts[0].path=/'
```

### SSL

#### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

#### Create

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n wordpress
```

```sh
helm upgrade wordpress stable/wordpress -f <(yq m <(cat << EOF
ingress:
  tls:
    - secretName: example.tls-secret
      hosts:
        - wordpress.$(minikube ip).nip.io
EOF
) <(helm get values wordpress))
```

#### Remove

```sh
helm upgrade wordpress stable/wordpress -f <(yq d <(helm get values wordpress) ingress.tls)

kubectl delete secret example.tls-secret -n wordpress
```

### Status

```sh
kubectl rollout status deploy/wordpress -n wordpress
```

### Logs

```sh
kubectl logs -l 'app=wordpress' -n wordpress -f
```

### DNS

```sh
dig @10.96.0.10 wordpress.wordpress.svc.cluster.local +short
nslookup wordpress.wordpress.svc.cluster.local 10.96.0.10
```

#### ExternalDNS

```sh
dig @10.96.0.10 "wordpress.$(minikube ip).nip.io" +short
nslookup "wordpress.$(minikube ip).nip.io" 10.96.0.10
```

### Secret

```sh
kubectl get secret wordpress \
  -o jsonpath='{.data.wordpress-password}' \
  -n wordpress | \
    base64 --decode; echo
```

### Delete

```sh
helm delete wordpress --purge
kubectl delete namespace wordpress --grace-period=0 --force
```

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
  -e MYSQL_USER='wordpress' \
  -e MYSQL_PASSWORD='wordpress' \
  -e MYSQL_DATABASE='wordpress_dev' \
  -v wordpress-mysql-data:/var/lib/mysql \
  -p 3306:3306 \
  --name wordpress-mysql \
  --network workbench \
  docker.io/library/mysql:5.7
```

```sh
# Apache CGI
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h wordpress \
  -e WORDPRESS_DB_HOST='wordpress-mysql' \
  -e WORDPRESS_DB_PORT='3306' \
  -e WORDPRESS_DB_USER='wordpress' \
  -e WORDPRESS_DB_PASSWORD='wordpress' \
  -e WORDPRESS_DB_NAME='wordpress_dev' \
  -v wordpress-data:/var/www/html \
  -v wordpress-uploads:/var/www/html/wp-content/uploads \
  -p 8080:80 \
  --name wordpress \
  --network workbench \
  docker.io/library/wordpress:5.4.2-apache
```

> Wait! This process take a while.

```sh
docker logs -f wordpress | sed '/Complete! WordPress has been successfully copied to \/var\/www\/html/ q'
```

```sh
# Or, with FPM
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h wordpress \
  -e WORDPRESS_DB_HOST='wordpress-mysql' \
  -e WORDPRESS_DB_USER='wordpress' \
  -e WORDPRESS_DB_PASSWORD='wordpress' \
  -e WORDPRESS_DB_NAME='wordpress_dev' \
  -v wordpress-data:/var/www/html \
  -p 9000:9000 \
  --name wordpress \
  --network workbench \
  docker.io/library/wordpress:5.4.2-fpm-alpine

docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h nginx \
  -v wordpress-nginx-conf:/etc/nginx/conf.d \
  -v wordpress-data:/var/www/html \
  -p 8080:80 \
  --name wordpress-nginx \
  --network workbench \
  docker.io/library/nginx:1.17-alpine

docker exec -i wordpress-nginx /bin/sh << \EOSHELL
cat << \EOF > /etc/nginx/conf.d/wordpress.conf
upstream wordpress {
    server wordpress:9000;
}

server {
    listen 80 default_server;
    root /var/www/html;
    index index.php index.html;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        fastcgi_pass wordpress;
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
docker restart wordpress-nginx
```

```sh
# Health check
curl -i 'http://127.0.0.1:8080/health-check'

# Open
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

1. Select Language -> Continue
2. Welcome
   - Site Title: `Example`
   - Username: `admin`
   - Password: `Pa$$w0rd!`
   - Confirm Password: (Check) Confirm use of weak password
   - Your Email: `admin@example.com`
   - Install WordPress
3. Success! -> Log In

### Database

```sh
# Backup
mysqldump \
  -h 127.0.0.1 \
  -P 3306 \
  -u wordpress \
  -p'wordpress' \
  wordpress_dev \
  > /path/to/dump/wordpress-$(gdate +%Y-%m-%d-%H-%M).sql

du -h /path/to/dump/wordpress-*.sql

# Restore
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -u root \
  -p'root' \
  wordpress_dev \
  < /path/to/dump/wordpress-$(gdate +%Y-%m-%d-%H-%M).sql
```

### Remove

```sh
docker rm -f wordpress-mysql wordpress wordpress-nginx
docker volume rm wordpress-mysql-data wordpress-data wordpress-nginx-conf
```

## Host

### Dependencies

- [WP-CLI](/wp-cli.md)
- [GNU Wget](/gnu_wget.md)
- PHP
  - [PHP FastCGI Process Manager (FPM)](/php-fpm.md)
- Database
  - [MySQL](/mysql.md#docker)
- HTTP Server
  - [Apache HTTP Server (HTTPd)](/apache_httpd.md#php-fpm)
  - [NGINX](/nginx.md#php-fpm)
  - [Caddy](/caddy.md#php-fpm)

### Installation

#### WP-CLI

```sh
# Darwin
sudo install -dm 775 -o "$USER" -g admin '/var/www/wordpress-latest' && cd "$_"

sudo unlink '/var/www/html'

sudo ln -s '/var/www/wordpress-latest' '/var/www/html' && \
  sudo chown -h "$USER": "$_"
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h wordpress-mysql \
  -e MYSQL_ROOT_PASSWORD='root' \
  -e MYSQL_USER='wordpress' \
  -e MYSQL_PASSWORD='wordpress' \
  -e MYSQL_DATABASE='wordpress' \
  -v wordpress-mysql-data:/var/lib/mysql \
  -p 3306:3306 \
  --name wordpress-mysql \
  docker.io/library/mysql:5.7
```

```sh
#
wp core download

#
rm ./wp-config.php

wp config create \
  --dbname='wordpress' \
  --dbuser='wordpress' \
  --dbpass='wordpress' \
  --dbhost='127.0.0.1'

#
wp core install \
  --url='127.0.0.1:8080' \
  --title='Example' \
  --admin_user='admin' \
  --admin_email='admin@example.com' \
  --admin_password='Pa$$w0rd!'

#
wp site empty --yes

# Using built in PHP Server
## Start Server
nohup php -d memory_limit=8G -S 127.0.0.1:8080 &

## Tail Server
tail -f ./nohup.out

#
wp eval 'echo "[INFO]\t" . wp_login_url() . "\n";'

# Backup
mysqldump \
  -h 127.0.0.1 \
  -P 3306 \
  -u wordpress \
  -p'wordpress' \
  wordpress_dev \
  > /path/to/wordpress-$(gdate +%Y-%m-%d-%H-%M).sql

#
du -h /tmp/wordpress-$(gdate +%Y-%m-%d-%H-%M).sql

# Restore
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -u root \
  -p'root' \
  wordpress_dev \
  < /path/to/wordpress.sql

# Kill Server
pkill php

# Or
kill -9 "$(lsof -nPi tcp:8080 | grep LISTEN | awk '{print $2}')"
```

#### Wget

```sh
# Desired version
export WORDPRESS_VERSION=5.3
```

##### Darwin

```sh
# Create folder
sudo install -dm 775 -o "$USER" -g admin "/var/www/wordpress-$WORDPRESS_VERSION"

# Download
wget -O - "https://wordpress.org/wordpress-$WORDPRESS_VERSION.tar.gz" | \
  tar \
    -xzC '/var/www' \
    --no-same-owner \
    --no-same-permissions \
    --transform "s/wordpress/wordpress-$WORDPRESS_VERSION/" \
    wordpress
```

```sh
#
sudo unlink '/var/www/html'

#
sudo ln -s "/var/www/wordpress-$WORDPRESS_VERSION" '/var/www/html' && \
  sudo chown -h "$USER":admin "$_"
```

##### Linux

```sh
# Create folder
sudo install -dm 775 -o "$(id -u)" -g "$(id -g)" "/var/www/wordpress-$WORDPRESS_VERSION"

# Download
wget -O - "https://builds.wordpress.org/wordpress-$WORDPRESS_VERSION.tar.gz" | \
  sudo -u "$USER" tar \
    -xzC '/var/www' \
    --no-same-owner \
    --no-same-permissions \
    --transform "s/wordpress/wordpress-$WORDPRESS_VERSION/" \
    wordpress
```

```sh
#
sudo unlink '/var/www/html'

#
sudo ln -s "/var/www/wordpress-$WORDPRESS_VERSION" '/var/www/html' && \
  sudo chown -h "$USER": "$_"
```

### Issues

<!-- ####

```log
An automated WordPress update has failed to complete - please attempt the update again now.
```

TODO -->

<!-- #### Undefined Symbols

```log
Undefined function 'add_action'.intelephense(1010)
```

```sh
jq '."intelephense.diagnostics.undefinedSymbols" |= false' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
``` -->

## Snippets

### Upload Size

1. Tools
2. Site Health
3. Info Tab
4. Server

#### PHP Built-in web server

```sh
php \
  -d upload_max_filesize=32M \
  -d post_max_size=32M \
  -d max_execution_time=300 \
  -S \
  127.0.0.1:8080
```

#### Docker WordPress (`docker.io/library/wordpress:5.4.2-apache`):

```Dockerfile
RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini && \
    sed -i '/^upload_max_filesize =/s/= .*/= 32M/' /usr/local/etc/php/php.ini && \
    sed -i '/^post_max_size =/s/= .*/= 32M/' /usr/local/etc/php/php.ini && \
    sed -i '/^max_execution_time =/s/= .*/= 300/' /usr/local/etc/php/php.ini
```

#### WordPress `functions.php` file:

```php
@ini_set( 'upload_max_filesize' , '32M' );
@ini_set( 'post_max_size', '32M');
@ini_set( 'max_execution_time', '300' );
```

#### Kubernetes

```yml
ingress:
  annotations:
    nginx.ingress.kubernetes.io/proxy-body-size: '32m'
```

### Query Output

```php
$query = new WP_Query( array( ... ) );

//
echo $query->request;
```
