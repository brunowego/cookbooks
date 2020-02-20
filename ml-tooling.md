# Machine Learning Tooling

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -v mlhub-jupyterhub-data:/data \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  -p 8080:8080 \
  docker.io/mltooling/ml-hub:0.1.10
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -p 8080:8080 \
  docker.io/mltooling/ml-workspace:0.8.7
```

### Remove

```sh
docker rm -f mlhub
docker volume rm mlhub-jupyterhub-data
```
