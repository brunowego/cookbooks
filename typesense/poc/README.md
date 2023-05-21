# Typesense PoC

<!--
https://github.com/tradingstrategy-ai/search
-->

## Dependencies

- [Typesense with Docker](../README.md#docker)

## Configuration

```sh
#
export TYPESENSE_API_KEY='S3cr3t_K@Key'
export TYPESENSE_BASE_URL='http://127.0.0.1:8108'

#
curl \
  -s \
  -X POST "${TYPESENSE_BASE_URL}/collections" \
  -H "X-TYPESENSE-API-KEY: $TYPESENSE_API_KEY" \
  -d @collections/trading-entities.json | \
    jq .

#
curl \
  -s \
  -X POST "${TYPESENSE_BASE_URL}/keys" \
  -H "X-TYPESENSE-API-KEY: $TYPESENSE_API_KEY" \
  -d '{"description":"Oracle import key","actions":["*"],"collections":["trading-entities"]}' | \
    jq .

#
curl \
  -s \
  -X POST "${TYPESENSE_BASE_URL}/keys" \
  -H "X-TYPESENSE-API-KEY: $TYPESENSE_API_KEY" \
  -d '{"description":"Public search key","actions":["documents:search"],"collections":["*"]}' | \
    jq .
```
