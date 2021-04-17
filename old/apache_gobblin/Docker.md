# Docker

## Running

```sh
docker run -d \
  -h gobblin \
  -v /opt/gobblin/job-conf:/etc/gobblin \
  --name gobblin \
  gradiant/gobblin:latest
```

## Remove

```sh
docker rm -f gobblin
```
