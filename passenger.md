# Phusion Passenger

## Installation

```sh
sudo apt update
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
sudo apt -y install apt-transport-https ca-certificates

sudo /usr/bin/sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger xenial main > /etc/apt/sources.list.d/passenger.list'
sudo apt update

sudo apt -y install nginx-extras passenger

sudo systemctl start nginx
```

## Nginx

### Passenger

```sh
sudo vim /etc/nginx/nginx.conf

include /etc/nginx/passenger.conf;
```

```sh
sudo vim /etc/nginx/passenger.conf
passenger_ruby /home/deploy/.rbenv/shims/ruby;
```

```sh
sudo systemctl restart nginx
```

### Sites

```sh
sudo vim /etc/nginx/sites-available/[appname]
```

#### Without SSL

```conf
server {
	listen 80;
	listen [::]:80;

	root /home/deploy/[appname]/public;

	index index.html;

	server_name [example.com];

	passenger_enabled on;
	rails_env production;

	error_page 500 502 503 504 /50x.html;

	location = /50x.html {
		root html;
	}
}
```

#### With SSL

```conf
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

	passenger_enabled on;
	rails_env production;

	include snippets/self-signed.conf;
	include snippets/ssl-params.conf;
}
```

### Enable

```sh
sudo rm -f /etc/nginx/sites-enabled/default
sudo ln -s /etc/nginx/sites-available/[appname] /etc/nginx/sites-enabled
```

### Restart

```sh
sudo systemctl restart nginx
```
