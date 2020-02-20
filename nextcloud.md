# NextCloud

https://www.youtube.com/watch?v=USS3DZn2te8

## CLI

### Installation

#### Homebrew

```sh
brew cask install nextcloud
```

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/nextcloud#configuration)

### Install

```sh
kubectl create namespace nextcloud
```

```sh
helm install stable/nextcloud \
  -n nextcloud \
  --namespace nextcloud \
  --set image.tag=17.0.1-fpm-alpine \
  --set ingress.enabled=true \
  --set nextcloud.host="nextcloud.$(minikube ip).nip.io" \
  --set nextcloud.password="$(head -c 12 /dev/urandom | shasum | cut -d ' ' -f 1)" \
  --set nginx.enabled=true \
  --set mariadb.enabled=true
```

### SSL

#### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

#### Create

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n nextcloud
```

```sh
helm upgrade nextcloud stable/nextcloud -f <(yq m <(cat << EOF
ingress:
  tls:
    - secretName: example.tls-secret
      hosts:
        - nextcloud.$(minikube ip).nip.io
EOF
) <(helm get values nextcloud))
```

#### Remove

```sh
helm upgrade nextcloud stable/nextcloud -f <(yq d <(helm get values nextcloud) ingress.tls)

kubectl delete secret example.tls-secret -n nextcloud
```

### Status

```sh
kubectl rollout status deploy/nextcloud -n nextcloud
```

### Logs

```sh
kubectl logs -l 'app.kubernetes.io/name=nextcloud' -n nextcloud -f
```

### DNS

```sh
dig @10.96.0.10 nextcloud.nextcloud.svc.cluster.local +short
nslookup nextcloud.nextcloud.svc.cluster.local 10.96.0.10
```

#### ExternalDNS

```sh
dig @10.96.0.10 "nextcloud.$(minikube ip).nip.io" +short
nslookup "nextcloud.$(minikube ip).nip.io" 10.96.0.10
```

### Secret

```sh
kubectl get secret nextcloud \
  -o jsonpath='{.data.nextcloud-password}' \
  -n nextcloud | \
    base64 --decode; echo
```

### Delete

```sh
helm delete nextcloud --purge
kubectl delete namespace nextcloud --grace-period=0 --force
```

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h mysql \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_USER=nextcloud \
  -e MYSQL_PASSWORD=nextcloud \
  -e MYSQL_DATABASE=nextcloud \
  -v nextcloud-mysql-data:/var/lib/mysql \
  -p 3306:3306 \
  --name nextcloud-mysql \
  docker.io/library/mysql:5.7.19
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h nextcloud \
  -e MYSQL_HOST=nextcloud-mysql \
  -e MYSQL_USER=nextcloud \
  -e MYSQL_PASSWORD=nextcloud \
  -e MYSQL_DATABASE=nextcloud \
  -v nextcloud:/var/www/html \
  -v nextcloud-apps:/var/www/html/custom_apps \
  -v nextcloud-config:/var/www/html/config \
  -v nextcloud-data:/var/www/html/data \
  -p 9000:9000 \
  --name nextcloud \
  docker.io/library/nextcloud:17.0.1-fpm
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h nginx \
  -v nextcloud-nginx-conf:/etc/nginx/conf.d \
  -v nextcloud:/var/www/html \
  -p 8080:80 \
  --name nextcloud-nginx \
  docker.io/library/nginx:1.17.5-alpine
```

```sh
docker exec -i nextcloud-nginx /bin/sh << \EOSHELL
cat << \EOF > /etc/nginx/conf.d/nextcloud.conf
upstream php-handler {
    server nextcloud:9000;
}

server {
    listen 80 default_server;
    root /var/www/html;
    index index.php index.html;

    location = /robots.txt {
        allow all;
        log_not_found off;
        access_log off;
    }

    location / {
        rewrite ^ /index.php;
    }

    location ~ ^\/(?:build|tests|config|lib|3rdparty|templates|data)\/ {
        deny all;
    }

    location ~ ^\/(?:\.|autotest|occ|issue|indie|db_|console) {
        deny all;
    }

    location ~ ^\/(?:index|remote|public|cron|core\/ajax\/update|status|ocs\/v[12]|updater\/.+|oc[ms]-provider\/.+)\.php(?:$|\/) {
        fastcgi_split_path_info ^(.+?\.php)(\/.*|)$;
        set $path_info $fastcgi_path_info;
        try_files $fastcgi_script_name =404;

        include fastcgi_params;

        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param PATH_INFO $path_info;
        fastcgi_param modHeadersAvailable true;
        fastcgi_param front_controller_active true;
        fastcgi_pass php-handler;
        fastcgi_intercept_errors on;
        fastcgi_request_buffering off;
    }

    location ~ ^\/(?:updater|oc[ms]-provider)(?:$|\/) {
        try_files $uri/ =404;
        index index.php;
    }

    location ~ \.(?:css|js|woff2?|svg|gif|map)$ {
        try_files $uri /index.php$request_uri;

        add_header Cache-Control "public, max-age=15778463";
        add_header X-Content-Type-Options nosniff;
        add_header X-XSS-Protection "1; mode=block";
        add_header X-Robots-Tag none;
        add_header X-Download-Options noopen;
        add_header X-Permitted-Cross-Domain-Policies none;
        add_header Referrer-Policy no-referrer;

        access_log off;
    }

    location ~ \.(?:png|html|ttf|ico|jpg|jpeg|bcmap)$ {
        try_files $uri /index.php$request_uri;
        access_log off;
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
docker restart nextcloud-nginx
```

```sh
# Health check
curl -i 'http://127.0.0.1:8080/health-check'

# Open
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```sh
docker rm -f nextcloud-mysql nextcloud nextcloud-nginx
docker volume rm nextcloud-mysql-data nextcloud nextcloud-apps nextcloud-config nextcloud-data nextcloud-nginx-conf
```
