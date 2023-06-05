# Process Manager 2 (PM2)

<!--
https://github.com/ahmadyusri/booking-app-nodejs/blob/master/etc/docker-entrypoint-app.sh
-->

**Keywords:** Daemon Process Manager

## Links

- [Code Repository](https://github.com/Unitech/pm2)
- [Main Website](https://pm2.keymetrics.io)

## References

- [Cheatsheet](https://devhints.io/pm2)
- [Log management](https://pm2.keymetrics.io/docs/usage/log-management/)

## Library

### Installation

```sh
# With pnpm
pnpm add pm2 -D
```

## CLI

### Installation

```sh
# With NPM
npm install pm2 -g
```

### Commands

```sh
pm2 -h
```

### Usage

```sh
# Running app
pm2 start ./app.js

#
pm2 start ./api.js -i <process>

# List running apps
pm2 list

#
pm2 stop <app-name>
pm2 restart <app-name>
pm2 delete <app-name>

# View details
pm2 describe <app-name>

# Monitoring
pm2 monit

#
pm2 reload all --update-env

#
pm2 logs
pm2 logs <app-name>
pm2 logs --json
pm2 logs --format

#
pm2 flush

#
pm2 reloadLogs

#
pm2 startup
pm2 save
pm2 unstartup

#
pm2 install <module_name>

#
pm2 update

#
pm2 reset <app-name>

#
pm2 scale <app-name> 10

#
pm2 save

#
pm2 resurrect

#
pm2 generate
```

### Tips

#### Read Logs

```sh
tail -f "$HOME"/.pm2/logs/<app-name>-error.log
tail -f "$HOME"/.pm2/logs/<app-name>-out.log

# Put it over HTTP server
( cd "$HOME"/.pm2/logs; python -m SimpleHTTPServer 8000 ) # Python v2.x
( cd "$HOME"/.pm2/logs; python -m http.server 8000 ) # Python v3.x

#
watch -n 2 'curl <domain>:8000/<app-name>-error.log'
watch -n 2 'curl <domain>:8000/<app-name>-out.log'
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
  -h pm2 \
  --name pm2 \
  --network workbench \
  docker.io/keymetrics/pm2:14-alpine pm2 -h
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:4000'
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

    error_page 500 502 503 504 /50x.html;
    location = /50x.html {
        root /usr/share/nginx/html;
    }
}
EOF
```

```Dockerfile
FROM docker.io/library/node:13.5.0-alpine AS build

WORKDIR /usr/src/app

COPY ./package*.json ./

RUN npm i

COPY ./ ./

RUN npm run build

# ---

FROM docker.io/library/nginx:1.17.5-alpine

COPY ./default.conf /etc/nginx/conf.d

COPY --from=build /usr/src/app/dist /usr/share/nginx/html

EXPOSE 4000

CMD ["pm2-runtime", "./src/index.js"]
```
