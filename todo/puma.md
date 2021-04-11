# Puma

TODO

<!-- ## Rbenv

```sh
grep -c processor /proc/cpuinfo
```

```sh
vim .rbenv-vars

RAILS_MAX_THREADS=2
```

```sh
rbenv vars
``` -->

<!-- ## Nginx

```sh
sudo apt update
sudo apt -y install nginx
```

### Sites

```sh
sudo vim /etc/nginx/sites-available/[appname]
```

#### Without SSL

```conf
upstream app {
	server unix:/home/deploy/[appname]/shared/sockets/puma.sock fail_timeout=0;
}

server {
	listen 80;
	listen [::]:80;

	root /home/deploy/[appname]/public;

	server_name [example.com];

	try_files $uri/index.html $uri @app;

	location @app {
		proxy_pass http://app;
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		proxy_set_header Host $http_host;
		proxy_redirect off;
	}
}
```

#### With SSL

```conf
upstream app {
	server unix:/home/deploy/[appname]/shared/sockets/puma.sock fail_timeout=0;
}

server {
	listen 80;
	listen [::]:80;

	server_name [example.com];

	return 302 https://$server_name$request_uri;
}

server {
	listen 443 ssl http2;
	listen [::]:443 ssl http2;

	root /home/deploy/[appname]/public;

	server_name [example.com];

	try_files $uri/index.html $uri @app;

	location @app {
		proxy_pass http://app;
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		proxy_set_header Host $http_host;
		proxy_redirect off;
	}

	include snippets/self-signed.conf;
	include snippets/ssl-params.conf;
}
```

### More

```conf
server {
    ...

    error_page 500 502 503 504 /500.html;
    client_max_body_size 4G;
    keepalive_timeout 10;
}
```

### Enable

```sh
sudo ln -s /etc/nginx/sites-available/[appname] /etc/nginx/sites-enabled
```

### Test

```sh
sudo nginx -t

nginx: [warn] "ssl_stapling" ignored, issuer certificate not found
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
```

### Restart

```sh
sudo systemctl restart nginx
``` -->
