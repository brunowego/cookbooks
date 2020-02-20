# Apache Tomcat

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h tomcat \
  -p 8080:8080 \
  --name tomcat \
  tomcat:9-jdk11-slim
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

## Remove

```sh
docker rm -f tomcat
```
