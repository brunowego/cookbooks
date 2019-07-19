# Redmine

## Docker

### Volume

```sh
docker volume create redmine-postgres-data
docker volume create redmine-files
```

### Running

```sh
docker run -d \
  -h postgres.redmine.local \
  -e POSTGRES_USER=redmine \
  -e POSTGRES_PASSWORD=redmine \
  -e POSTGRES_DB=redmine \
  -v redmine-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name redmine-postgres \
  --restart always \
  postgres:11.2-alpine
```

```sh
docker run -d \
  -h redmine.local \
  -e REDMINE_DB_POSTGRES=redmine-postgres \
  -e REDMINE_DB_USERNAME=redmine \
  -e REDMINE_DB_PASSWORD=redmine \
  -e REDMINE_DB_DATABASE=redmine \
  -v redmine-files:/usr/src/redmine/files \
  -p 3000:3000 \
  --name redmine \
  --restart always \
  --link redmine-postgres \
  redmine:4.0.3
```

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):3000"
```

| Login | Password |
| --- | --- |
| admin | admin |

## Remove

```sh
docker rm -f redmine-postgres redmine
docker volume rm redmine-postgres-data redmine-files
```
