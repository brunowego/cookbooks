# Docker

## Running

```sh
docker run -d \
  -h proxysql \
  -p 6032:6032 \
  -p 6033:6033 \
  -p 6080:6080 \
  --name proxysql
  proxysql
```

## Connect

```sh
docker exec -it proxysql mysql -h 127.0.0.1 -P 6032 -u admin -padmin
```

### Query

```sh
docker exec -i proxysql mysql -h 127.0.0.1 -P 6032 -u admin -padmin -e 'SELECT * FROM mysql_servers'
```

## Remove

```sh
docker rm -f proxysql
```
