# RainLoop

<!--
https://github.com/hardware/mailserver/wiki/Rainloop-initial-configuration
https://github.com/shadow1163/dockerfiles/blob/master/mailserver/docker-compose.yml
-->

## Docker

### Dependencies

- [PostfixAdmin](/postfixadmin.md) or [docker-mailserver](/docker-mailserver.md)

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h rainloop \
  -v rainloop-data:/rainloop/data \
  -p 8889:8888 \
  --name rainloop \
  docker.io/hardware/rainloop:1.13.0
```

### Configuration

1. Go to the admin page:

   ```sh
   echo -e '[INFO]\thttp://127.0.0.1:8889/?admin'
   ```

   | Username | Password |
   | --- | --- |
   | `admin` | `12345` |

2. Domains -> Add Domain
   - Name: `example.com`
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
docker rm -f grafana
docker volume rm grafana-config grafana-data
```
