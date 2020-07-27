# PeerTube

## References

- [Dotenv Example File](https://github.com/Chocobozzz/PeerTube/blob/develop/support/docker/production/.env)
- [Custom Environment Variables](https://github.com/Chocobozzz/PeerTube/blob/develop/support/docker/production/config/custom-environment-variables.yaml)

<!--
https://github.com/Chocobozzz/PeerTube/blob/develop/support/doc/tools.md#reset-passwordjs
-->

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
  -h postgres \
  -e POSTGRES_USER='peertube' \
  -e POSTGRES_PASSWORD='peertube' \
  -e POSTGRES_DB='peertube' \
  -v peertube-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name peertube-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h redis \
  -v peertube-redis-data:/data \
  --name peertube-redis \
  --network workbench \
  docker.io/library/redis:5.0.4-alpine3.9 redis-server --appendonly yes
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h postfix \
  --name peertube-postfix \
  -e POSTFIX_myhostname='peertube' \
  --network workbench \
  docker.io/mwader/postfix-relay:latest
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h peertube \
  -v peertube-config:/config \
  -v peertube-data:/data \
  -e POSTGRES_USER='peertube' \
  -e POSTGRES_PASSWORD='peertube' \
  -e POSTGRES_DB='peertube' \
  -e PEERTUBE_DB_USERNAME='peertube' \
  -e PEERTUBE_DB_PASSWORD='peertube' \
  -e PEERTUBE_DB_HOSTNAME='peertube-postgres' \
  -e PEERTUBE_REDIS_HOSTNAME='peertube-redis' \
  -e PEERTUBE_WEBSERVER_HOSTNAME='127.0.0.1' \
  -e PEERTUBE_WEBSERVER_PORT='80' \
  -e PEERTUBE_WEBSERVER_HTTPS='false' \
  -e PEERTUBE_TRUST_PROXY='["127.0.0.1", "loopback", "172.18.0.0/16"]' \
  -e PEERTUBE_SMTP_USERNAME='' \
  -e PEERTUBE_SMTP_PASSWORD='' \
  -e PEERTUBE_SMTP_HOSTNAME='peertube-postfix' \
  -e PEERTUBE_SMTP_PORT='25' \
  -e PEERTUBE_SMTP_FROM='noreply@peertube.local' \
  -e PEERTUBE_SMTP_TLS='false' \
  -e PEERTUBE_SMTP_DISABLE_STARTTLS='false' \
  -e PEERTUBE_ADMIN_EMAIL='admin@peertube.local' \
  -e POSTFIX_myhostname='peertube' \
  -e PEERTUBE_SIGNUP_ENABLED='true' \
  -e PEERTUBE_TRANSCODING_ENABLED='true' \
  -e PEERTUBE_CONTACT_FORM_ENABLED='true' \
  -p 9000:9000 \
  --name peertube \
  --network workbench \
  docker.io/chocobozzz/peertube:production-buster
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:9000'
```

$ sudo -u peertube NODE_CONFIG_DIR=/var/www/peertube/config NODE_ENV=production npm run reset-password -- -u target_username


### Shell

```sh
docker exec -it peertube /bin/bash
```

### Remove

```sh
docker rm -f peertube-postgres peertube-redis peertube-postfix peertube

docker volume rm peertube-postgres-data peertube-redis-data peertube-config peertube-data
```
