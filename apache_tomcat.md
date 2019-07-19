# Apache Tomcat

## Docker

### Running

```sh
docker run -d \
  $(echo $DOCKER_RUN_OPTS) \
  -h tomcat \
  -p 8080:8080 \
  --name tomcat \
  --restart always \
  tomcat:9-jdk11-slim
```

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):8080"
```

## Remove

```sh
docker rm -f tomcat
```
