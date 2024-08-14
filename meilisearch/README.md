# Meilisearch

<!--
https://blog.meilisearch.com/multi-tenancy/

https://github.com/ElektronPlus/school-website
https://github.com/Okampus/okampus
https://github.com/Console45/nest-meilisearch

https://github.com/meilisearch/meilisearch-kubernetes/tree/main/charts/meilisearch
-->

**Keywords:** Search Engine

## Links

- [Code Repository](https://github.com/meilisearch/meilisearch)
- [Main Website](https://meilisearch.com)
- [Comparison to alternatives](https://docs.meilisearch.com/learn/what_is_meilisearch/comparison_to_alternatives.html#comparison-table)

## Tools

- [Airbyte / Open-source ETL to MeiliSearch](https://airbyte.com/connectors/meilisearch)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h meilisearch \
  -v meilisearch-data:/meili_data \
  -e MEILI_HTTP_ADDR='0.0.0.0:7700' \
  -e MEILI_MASTER_KEY='masterKey' \
  -e MEILI_ENV='development' \
  -e MEILI_NO_ANALYTICS='true' \
  -p 7700:7700 \
  --name meilisearch \
  --network workbench \
  docker.io/getmeili/meilisearch:v1.4.0
```

<!--
https://github.com/meilisearch/meilisearch/blob/main/meilisearch-http/src/option.rs
-->

```sh
echo -e '[INFO]\thttp://127.0.0.1:7700'
```

### Remove

```sh
docker rm -f meilisearch

docker volume rm meilisearch-data
```

## Docker Compose

**Refer:** `./.env`

```env
MEILI_HTTP_PORT=7700
MEILI_HTTP_ADDR=0.0.0.0:$MEILI_HTTP_PORT
MEILI_MASTER_KEY=masterKey
MEILI_ENV=development
MEILI_NO_ANALYTICS=true
```

**Refer:** `./docker-compose.yml`

```yml
---
services:
  meilisearch:
    image: docker.io/getmeili/meilisearch:v1.4.0
    hostname: meilisearch
    volumes:
      - type: volume
        source: meilisearch-data
        target: /meili_data
    environment:
      MEILI_HTTP_ADDR:
      MEILI_MASTER_KEY:
      MEILI_ENV:
      MEILI_NO_ANALYTICS:
    ports:
      - target: 7700
        published: $MEILI_HTTP_PORT
        protocol: tcp
    restart: unless-stopped

volumes:
  meilisearch-data:
    driver: local
```
