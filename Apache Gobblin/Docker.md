# Docker

## Running

```sh
docker run -d \
  -h gobblin \
  -v /opt/gobblin/job-conf:/etc/gobblin \
  --name gobblin \
  --restart always \
  gradiant/gobblin:latest
```
