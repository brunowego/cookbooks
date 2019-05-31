# NGINX

## Configuration

```sh
sudo useradd -d /var/www -rs /sbin/nologin www-data
```

```sh
sudo usermod -aG www-data $USER && sudo su - $USER
```

```sh
sudo install -dm 755 -o www-data -g www-data /var/www
```

## Installation

```sh
curl https://builds.matomo.org/matomo-3.9.1.tar.gz | sudo -u www-data tar -xzC /var/www --transform s/matomo/matomo-3.8.0/ matomo --no-same-owner --no-same-permissions
sudo ln -s /var/www/matomo-3.8.0 /var/www/matomo
```

```sh
sudo restorecon -r /var/www/matomo
```

```sh
sudo find /var/www/matomo/ -type d -exec chmod 755 {} \;
sudo find /var/www/matomo/ -type f -exec chmod 644 {} \;
```

### CentOS

Configure SELinux to `permissive`.

## Dependencies

Remove existing server configuration in `nginx.conf`:

```sh
sudo sed -ri '38,57 s/^( ?){4}?/    # /' /etc/nginx/nginx.conf
```

## Configuration

```sh
sudo sed -i '/^user/s/nginx/www-data/' /etc/nginx/nginx.conf
```

```sh
sudo tee /etc/nginx/conf.d/matomo.conf << 'EOF'
upstream matomo {
    server 127.0.0.1:9000;
}

server {
    listen 80 default_server;
    root /var/www/matomo;
    index index.php index.html;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        fastcgi_pass matomo;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
}

EOF
```

## Process

```sh
ps aux | grep nginx
```

## Persist

```sh
sudo systemctl restart nginx
```

## Test

```sh
sudo nginx -t
```
