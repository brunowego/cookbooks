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
  -h nifi \
  -v nifi-conf:/opt/nifi/nifi-current/conf \
  -p 8080:8080 \
  --name nifi \
  docker.io/apache/nifi:1.9.2
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080/nifi'
```

### Remove

```sh
docker rm -f nifi
```
