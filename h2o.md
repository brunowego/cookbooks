# H2O

## Docker

### Running

```sh
docker run -d \
  -h h2o \
  -p 54321:54321 \
  --name h2o \
  --restart always \
  brunowego/h2o:3.26.0.1
```

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):54321"
```

### Remove

```sh
docker rm -f h2o
```
