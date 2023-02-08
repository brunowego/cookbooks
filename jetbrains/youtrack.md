# JetBrains YouTrack

## Links

- [Main Website](https://jetbrains.com/youtrack/)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h youtrack \
  -v youtrack-data:/opt/youtrack/data \
  -v youtrack-conf:/opt/youtrack/conf \
  -v youtrack-logs:/opt/youtrack/logs \
  -v youtrack-backups:/opt/youtrack/backups \
  -p 8080:8080 \
  --name youtrack \
  --network workbench \
  docker.io/jetbrains/youtrack:2022.3.65369
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

```sh
docker exec -it youtrack cat /opt/youtrack/conf/internal/services/configurationWizard/wizard_token.txt
```

### Remove

```sh
docker rm -f youtrack

docker volume rm youtrack-data youtrack-conf youtrack-logs youtrack-backups
```
