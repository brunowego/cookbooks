# ChartDB

**Keywords:** Diagram Editor

## Links

- [Code Repository](https://github.com/chartdb/chartdb)
- [Main Website](https://chartdb.io)

## Docker

### Running

```sh
#
export OPENAI_API_KEY=''

#
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h chartdb \
  --name chartdb \
  -e OPENAI_API_KEY="$OPENAI_API_KEY" \
  -p 8080:80 \
  ghcr.io/chartdb/chartdb:latest

#
# http://localhost:8080
```
