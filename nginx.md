# NGINX (Engine X)

## CLI

### Dependencies

- [CentOS Repo's](/centos.md#repositories)

### Pre-flight

```sh
# Stop built in Apache (Linux/Darwin)
sudo apachectl stop

# Darwin
sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist

# Linux
sudo systemctl disable --now httpd
```

### Installation

#### Homebrew

```sh
brew install nginx
```

#### YUM

```sh
yum check-update

# Repo: EPEL
sudo yum -y install nginx

# Repo: Software Collections
sudo yum -y install rh-nginx114
scl enable rh-nginx114 "$SHELL"
sudo /usr/bin/sh -c 'echo "source scl_source enable rh-nginx114" >> /etc/profile.d/scl.sh'
```

#### APT

```sh
sudo apt update
sudo apt -y install nginx
```

#### APK

```sh
sudo apk update
sudo apk add nginx
```

#### Chocolatey

```sh
choco install -y nginx
```

### Commands

```sh
nginx -h
```

### Configuration

<!-- ```sh
# Darwin
mkdir -p /usr/local/etc/nginx/servers
mkdir -p /usr/local/etc/nginx/default.d
/usr/local/etc/nginx
/usr/local/etc/nginx/servers/*;

# Linux
mkdir -p /etc/nginx/default.d
/etc/nginx
/etc/nginx/conf.d/*.conf;
``` -->

<!-- ```sh
# Linux
sudo useradd -d /var/lib/nginx -rs /sbin/nologin nginx
sudo usermod -aG nginx "$USER" && sudo su - "$USER"
```

```sh
# Linux
sudo mkdir -m 755 -p /var/www && sudo chown -R nginx: "$_"
``` -->

#### Homebrew

```sh
# Darwin
http {
    # ..
    server {
        # ...

        # Load configuration files for the default server block.
        include /usr/local/etc/nginx/default.d/*.conf;
    }
}

# Linux
http {
    # ..
    server {
        # ...

        # Load configuration files for the default server block.
        include /etc/nginx/default.d/*.conf;
    }
}
```

### Service

```sh
# Homebrew
brew services start nginx

# Systemd
sudo systemctl enable --now nginx
```

```sh
# Darwin
xdg-open 'http://127.0.0.1:8080' || open 'http://127.0.0.1:8080' || echo -e '[INFO]\thttp://127.0.0.1:8080'

# Linux
xdg-open 'http://127.0.0.1' || open 'http://127.0.0.1' || echo -e '[INFO]\thttp://127.0.0.1'
```

### Tips

####

##### Configuration

###### Current Directory (HTTP)

```sh
# (Darwin)
cat << EOF > ./nginx.conf
events {}

http {
	include /usr/local/etc/nginx/mime.types;

	server {
		listen 8080;
		access_log http.access.log;
		error_log http.error.log;

		root .;

		location / {

		}

		location = /health-check {
				access_log off;
				default_type application/json;
				return 200 '{"status": "ok"}';
		}
	}
}
EOF
```

###### Proxy with SSL

```sh
sudo install -dm 755 -o "$USER" -g staff /etc/ssl/certs/nginx.local
mkdir -p /etc/ssl/certs/nginx.local/{ca,server,client}

CAROOT=/etc/ssl/certs/nginx.local/ca \
  mkcert -install

CAROOT=/etc/ssl/certs/nginx.local/ca \
  mkcert \
    -cert-file /etc/ssl/certs/nginx.local/server/server.pem \
    -key-file /etc/ssl/certs/nginx.local/server/server.key \
    nginx.local \
    $(ip route get 1 | awk '{print $NF;exit}') \
    '*.nginx.local' \
    localhost \
    127.0.0.1 \
    ::1
```

```sh
# (Darwin)
cat << EOF > ./nginx.conf
events {}

http {
	include /usr/local/etc/nginx/mime.types;

	server {
		listen 443 ssl;
		access_log http.access.log;
		error_log http.error.log;

		ssl_certificate /etc/ssl/certs/nginx.local/server/server.pem;
		ssl_certificate_key /etc/ssl/certs/nginx.local/server/server.key;

		location / {
			proxy_pass http://127.0.0.1:8000;
		}

		location = /health-check {
				access_log off;
				default_type application/json;
				return 200 '{"status": "ok"}';
		}
	}
}
EOF
```

##### Running

```sh
#
nginx \
  -p ./ \
  -c ./nginx.conf

#
nginx \
  -s stop \
  -p ./
```

#### CORS

```conf
location / {
    # Simple requests
    if ($request_method ~* '(GET|POST)') {
        add_header Access-Control-Allow-Origin '*';
    }

    # Preflighted requests
    if ($request_method = OPTIONS) {
        add_header Access-Control-Allow-Origin '*';
        add_header Access-Control-Allow-Methods 'GET, POST, OPTIONS';
        add_header Access-Control-Allow-Headers 'Origin, X-Requested-With, Content-Type';

        return 200;
    }
}
```

#### Visual Studio Code

```sh
code --install-extension shanoor.vscode-nginx
```

#### EditorConfig

```sh
cat << EOF >> ./.editorconfig

[*.conf]
indent_size = 4
EOF
```

#### Default Permissions

```sh
sudo find /var/www/html -type d -exec chmod 755 {} \;
sudo find /var/www/html -type f -exec chmod 644 {} \;
```

#### Htpasswd Configuration

```sh
sudo htpasswd -c /etc/nginx/htpasswd [username]
```

Add to `/etc/nginx/conf.d/[name].conf` the below code:

```conf
server {
    auth_basic 'Restricted Access';
    auth_basic_user_file /etc/nginx/htpasswd;
}
```

```sh
# Systemd
sudo systemctl restart nginx

# Test
sudo nginx -t
```

#### Proxy Pass Configuration

```sh
# Homebrew
tee /usr/local/etc/nginx/servers/[name].conf << 'EOF'
server {
    listen [port];

    location / {
        proxy_set_header Host $host;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header X-Real_IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_cache off;
        proxy_pass http://[hostname]:[port];
    }
}

EOF

# Linux
tee /etc/nginx/conf.d/[name].conf << 'EOF'
server {
    listen [port];

    location / {
        proxy_set_header Host $host;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header X-Real_IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_cache off;
        proxy_pass http://[hostname]:[port];
    }
}

EOF
```

```sh
# Homebrew
brew services restart nginx

# Systemd
sudo systemctl restart nginx

# Test
sudo nginx -t
```

#### PHP-FPM

```sh
# Linux
## Add ping/status page
sudo tee /etc/nginx/default.d/php-fpm.conf << 'EOF'
location ~ ^/(ping|status)$ {
    fastcgi_pass 127.0.0.1:9000;
    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    include fastcgi_params;
}
EOF
```

> **Darwin**: Prefix with `/usr/local` the path of `php-fpm.conf` file.

```sh
# Homebrew
brew services restart nginx

# Systemd
sudo systemctl restart nginx

# Test
sudo nginx -t
```

### Logs

```sh
# Linux
sudo chmod -R +rx /var/log/nginx
tail -f /var/log/nginx/access.log
tail -f /var/log/nginx/error.log
```

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h nginx \
  -v nginx-conf:/etc/nginx/conf.d \
  -p 8080:80 \
  --name nginx \
  docker.io/library/nginx:1.17.5-alpine
```

### Config

```sh
docker exec -i nginx /bin/sh << EOSHELL
cat << EOF > /etc/nginx/conf.d/default.conf
server {

}
EOF
EOSHELL
```

```sh
docker restart nginx
```

### Remove

```sh
docker rm -f nginx
docker volume rm nginx-conf
```

## Dockerfile

### Image

```sh
cat << EOF > ./default.conf
server {
    listen 80;
    server_name localhost;

    location / {
        root /usr/share/nginx/html;
        index index.html index.htm;
    }

    location /server_status {
        stub_status;
    }

    error_page 404 /404.html;

    error_page 500 502 503 504 /50x.html;
    location = /50x.html {
        root /usr/share/nginx/html;
    }
}
EOF
```

```Dockerfile
FROM docker.io/library/nginx:1.17.5-alpine

COPY ./default.conf /etc/nginx/conf.d

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
```
