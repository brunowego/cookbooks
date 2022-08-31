# Meilisearch

<!--
https://github.com/ElektronPlus/school-website
https://github.com/Okampus/okampus
-->

## Alternatives

- Algolia
- Typesense
- Elasticsearch

## Links

- [Code Repository](https://github.com/meilisearch/meilisearch)
- [Main Website](https://meilisearch.com/)
- [Comparison to alternatives](https://docs.meilisearch.com/learn/what_is_meilisearch/comparison_to_alternatives.html#comparison-table)

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
  docker.io/getmeili/meilisearch:v0.28.1
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
