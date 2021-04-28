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

<!-- ```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h mailhog \
  -p 1025:1025 \
  -p 8025:8025 \
  --name listmonk-mailhog \
  --network workbench \
  docker.io/mailhog/mailhog:v1.0.1
``` -->

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

<!-- -e LISTMONK_app__from_email='noreply <noreply@example.com>' \
-e LISTMONK_smtp__my0__enabled='true' \
-e LISTMONK_smtp__my0__host='listmonk-mailhog' \
-e LISTMONK_smtp__my0__port='1025' \
-e LISTMONK_smtp__my0__auth_protocol='plain' \
-e LISTMONK_smtp__my0__username='' \
-e LISTMONK_smtp__my0__password='' \
-e LISTMONK_smtp__my0__max_conns='10' \
-e LISTMONK_smtp__my0__idle_timeout='15s' \
-e LISTMONK_smtp__my0__wait_timeout='5s' \
-e LISTMONK_smtp__my0__tls_enabled='true' \
-e LISTMONK_smtp__my0__tls_skip_verify='true' \

LISTMONK_smtp__smtp_main__username
LISTMONK_smtp__smtp_main__password -->

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

### Issues

#### Disable STARTTLS

```log
Error sending test: SMTP STARTTLS extension not found
```

1. Settings
2. SMTP Tab
3. Disable TLS

#### No Auth

```log
Error sending test: unencrypted connection
```

1. Settings
2. SMTP Tab
3. Auth protocol -> Select none

<!-- ## CLI

```sh
LISTMONK_app__from_email='noreply <noreply@yoursite.com>' \
LISTMONK_smtp__my0__enabled=true \
LISTMONK_smtp__my0__host='email-smtp.us-east-1.amazonaws.com' \
LISTMONK_smtp__my0__port=587 \
LISTMONK_smtp__my0__auth_protocol=plain \
LISTMONK_smtp__my0__username='[username]' \
LISTMONK_smtp__my0__password='[password]' \
LISTMONK_smtp__my0__max_conns=10 \
LISTMONK_smtp__my0__idle_timeout=15s \
LISTMONK_smtp__my0__wait_timeout=5s \
LISTMONK_smtp__my0__tls_enabled=true \
LISTMONK_smtp__my0__tls_skip_verify=false \
  ./listmonk
``` -->
