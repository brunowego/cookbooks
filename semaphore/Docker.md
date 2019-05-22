# Semaphore

## Volume

```sh
docker volume create semaphore-mysql-data
```

## Running

```sh
docker run -d \
  -h mysql.semaphore.local \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_USER=semaphore \
  -e MYSQL_PASSWORD=semaphore \
  -e MYSQL_DATABASE=semaphore \
  -v semaphore-mysql-data:/var/lib/mysql \
  -v /etc/localtime:/etc/localtime:ro \
  -p 3306:3306 \
  --name semaphore-mysql \
  --restart always \
  mysql:5.7
```

```sh
docker run -d \
  -h app.semaphore.local \
  -e SEMAPHORE_DB_HOST=semaphore-mysql \
  -e SEMAPHORE_DB_PORT=3306 \
  -e SEMAPHORE_DB_USER=semaphore \
  -e SEMAPHORE_DB_PASS=semaphore \
  -e SEMAPHORE_DB=semaphore \
  -e SEMAPHORE_PLAYBOOK_PATH=/etc/semaphore \
  -e SEMAPHORE_ADMIN=admin \
  -e SEMAPHORE_ADMIN_PASSWORD=admin \
  -e SEMAPHORE_ADMIN_NAME=Admin \
  -e SEMAPHORE_ADMIN_EMAIL=admin@localhost \
  -e SEMAPHORE_WEB_ROOT=http://0.0.0.0:3000 \
  -e TZ=America/Sao_Paulo \
  -v /etc/localtime:/etc/localtime:ro \
  -p 3000:3000 \
  --name semaphore-app \
  --restart always \
  --link semaphore-mysql \
  ansiblesemaphore/semaphore:v2.5.1
```

## Remove

```sh
docker rm -f semaphore-mysql semaphore-app
docker volume rm semaphore-mysql-data
```
