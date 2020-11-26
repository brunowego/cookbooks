# Apache NiFi

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
  -h nifi \
  -v nifi-logs:/opt/nifi/nifi-current/logs \
  -v nifi-provenance-repository:/opt/nifi/nifi-current/provenance_repository \
  -v nifi-state:/opt/nifi/nifi-current/state \
  -v nifi-conf:/opt/nifi/nifi-current/conf \
  -v nifi-content-repository:/opt/nifi/nifi-current/content_repository \
  -v nifi-database-repository:/opt/nifi/nifi-current/database_repository \
  -v nifi-flowfile-repository:/opt/nifi/nifi-current/flowfile_repository \
  -p 8080:8080 \
  --name nifi \
  docker.io/apache/nifi:1.12.1
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080/nifi'
```

### Remove

```sh
docker rm -f nifi

docker volume rm nifi-logs nifi-provenance-repository nifi-state nifi-conf nifi-content-repository nifi-database-repository nifi-flowfile-repository
```
