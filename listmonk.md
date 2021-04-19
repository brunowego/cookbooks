# listmonk

**Keywords**: Newsletter, Email Marketing, Mailing List

## References

- [Code Repository](https://github.com/knadh/listmonk)

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
  -e POSTGRES_USER='listmonk' \
  -e POSTGRES_PASSWORD='listmonk' \
  -e POSTGRES_DB='listmonk' \
  -v listmonk-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name listmonk-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h listmonk \
  -e LISTMONK_app__address='0.0.0.0:9000' \
  -e LISTMONK_app__admin_username='admin' \
  -e LISTMONK_app__admin_password='admin' \
  -e LISTMONK_db__host='listmonk-postgres' \
  -e LISTMONK_db__user='listmonk' \
  -e LISTMONK_db__password='listmonk' \
  -e LISTMONK_db__database='listmonk' \
  -v listmonk-config:/listmonk \
  -p 9000:9000 \
  --name listmonk \
  --network workbench \
  docker.io/listmonk/listmonk:v0.9.0-beta /bin/sh -c 'yes | ./listmonk --install && ./listmonk'
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:9000'
```

| Login | Password |
| --- | --- |
| `admin` | `admin` |

### Remove

```sh
docker rm -f listmonk-postgres listmonk

docker volume rm listmonk-postgres-data listmonk-config
```
