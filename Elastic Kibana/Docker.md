# Docker

## Running

```sh
docker run -d \
  -h kibana \
  -e ELASTICSEARCH_URL=http://[hostname]:9200 \
  -p 5601:5601 \
  --name kibana \
  --restart always \
  kibana:latest
```
