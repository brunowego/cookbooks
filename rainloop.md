# RainLoop

<!--
https://github.com/hardware/mailserver/wiki/Rainloop-initial-configuration
https://github.com/shadow1163/dockerfiles/blob/master/mailserver/docker-compose.yml
-->

## Docker

### Dependencies

- [PostfixAdmin](/postfixadmin.md) or [docker-mailserver](/docker-mailserver.md)

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h rainloop \
  -v rainloop-data:/rainloop/data \
  -p 8889:8888 \
  --name rainloop \
  --network workbench \
  docker.io/hardware/rainloop:1.13.0
```

### Configuration

1. Go to the admin page:

   ```sh
   echo -e '[INFO]\thttp://127.0.0.1:8889/?admin'
   ```

   | Username | Password |
   | -------- | -------- |
   | `admin`  | `12345`  |

2. Domains -> Add Domain

   - Name: `xyz.tld`
   - IMAP -> Server: `mailserver`
   - SMTP -> Server: `mailserver`
   - Test
   - Add

3. Go to the login page:

   ```sh
   echo -e '[INFO]\thttp://127.0.0.1:8889'
   ```

### Remove

```sh
docker rm -f rainloop

docker volume rm rainloop-data
```
