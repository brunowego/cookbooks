# Roundcube

<!--
https://github.com/therebelrobot/SecretSanta-fork/blob/master/shell_provisioner/module/roundcube.sh
-->

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Dependencies

- [docker-mailserver](/docker-mailserver.md)

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h postgres \
  -e POSTGRES_USER='roundcubemail' \
  -e POSTGRES_PASSWORD='roundcubemail' \
  -e POSTGRES_DB='roundcubemail' \
  -v roundcubemail-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name roundcubemail-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h roundcubemail \
  -e ROUNDCUBEMAIL_DB_TYPE='pgsql' \
  -e ROUNDCUBEMAIL_DB_HOST='roundcubemail-postgres' \
  -e ROUNDCUBEMAIL_DB_PORT='5432' \
  -e ROUNDCUBEMAIL_DB_USER='roundcubemail' \
  -e ROUNDCUBEMAIL_DB_PASSWORD='roundcubemail' \
  -e ROUNDCUBEMAIL_DB_NAME='roundcubemail' \
  -e ROUNDCUBEMAIL_DEFAULT_HOST='docker-mailserver' \
  -e ROUNDCUBEMAIL_DEFAULT_PORT='143' \
  -e ROUNDCUBEMAIL_SMTP_SERVER='docker-mailserver' \
  -e ROUNDCUBEMAIL_SMTP_PORT='25' \
  -p 8080:80 \
  --name roundcubemail \
  --network workbench \
  docker.io/roundcube/roundcubemail:1.4.2-apache
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

| Login | Password |
| --- | --- |
| `admin@example.com` | `Pa$$w0rd!` |

### Remove

```sh
docker rm -f roundcubemail-postgres roundcubemail
docker volume rm -f roundcubemail-postgres-data
```
