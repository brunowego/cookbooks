# MindsDB

**Keywords:** Low-Code Machine Learning, NLP

## Links

- [Code Repository](https://github.com/mindsdb/mindsdb)
- [Main Website](https://mindsdb.com)
- [Cloud](https://cloud.mindsdb.com)

## Key Features

- Question & Answering
- Sentiment Analysis
- Text Summarization

## Glossary

- Natural Language Processing (NLP)
- Online Analytical Processing (OLAP)

## Docker

### Links

- [Docs](https://docs.mindsdb.com/setup/self-hosted/docker)

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
  -h mindsdb \
  -p 47334:47334 \
  -p 47335:47335 \
  --name mindsdb \
  --network workbench \
  docker.io/mindsdb/mindsdb:23.5.3.2
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:47334'
echo -e '[INFO]\thttp://127.0.0.1:47335'
```

### Remove

```sh
docker rm -f mindsdb
```
