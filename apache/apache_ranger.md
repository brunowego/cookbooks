# Apache Ranger (Apache Argus)

<!--
https://www.youtube.com/watch?v=tJeLOVaVqjk

https://github.com/dabsterindia/LABs/tree/master/RANGER
https://github.com/AlibabaCloudDocs/emapreduce/tree/master/intl.en-US/User%20Guide/Component%20authorization/Ranger
https://github.com/bhagadepravin/commands/blob/master/ranger.md
https://github.com/dyozie/hugo-book-mkdocs/tree/master/content/ranger
https://github.com/ing-bank/rokku/tree/master/docs
https://github.com/codragonzuo/studynotes/tree/master/Ranger
https://github.com/gaelfoppolo/self-service-data-analytics/blob/master/doc-admin/Ranger/ranger_install.md
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
  -e POSTGRES_USER='postgres' \
  -e POSTGRES_PASSWORD='security' \
  -e POSTGRES_DB='ranger' \
  -v postgres-server-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name postgres-server \
  --network workbench \
  docker.io/library/postgres:11.2-alpine
```

```sh
docker exec -i postgres-server psql -U postgres <<-EOSQL
CREATE USER ranger WITH PASSWORD 'security';
CREATE USER admin WITH PASSWORD 'security';
GRANT ALL PRIVILEGES ON DATABASE ranger to admin;
EOSQL
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h ranger-admin \
  -p 6080:6080 \
  --name ranger-admin \
  --network workbench \
  docker.io/yamounane/ranger-admin:latest
```

> Wait! This process take a while.

```sh
echo -e '[INFO]\thttp://127.0.0.1:6080'
```

| Login | Password |
| --- | --- |
| `admin` | `admin` |

### Remove

```sh
docker rm -f postgres-server ranger-admin

docker volume rm postgres-server-data
```