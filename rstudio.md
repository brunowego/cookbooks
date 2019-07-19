# RStudio

## Docker

### Running

```sh
docker run -d \
  $(echo $DOCKER_RUN_OPTS) \
  -h rstudio \
  -e DISABLE_AUTH=true \
  -p 8787:8787 \
  --name rstudio \
  --restart always \
  rocker/rstudio:3.6.1
```

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):8787"
```

### Remove

```sh
docker rm -f rstudio
```
