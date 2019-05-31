# cURL

## Environment

```sh
export ELASTICSEARCH_URL=$(docker-machine ip):9200
```

## Nodes

### Status

```sh
curl -s "${ELASTICSEARCH_URL}/_nodes/stats" | jq '.nodes[].jvm.mem'
```

## Categories

```sh
curl -s "${ELASTICSEARCH_URL}/_cat"
```
