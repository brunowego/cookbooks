# pgvector

<!--
https://github.com/mazzasaverio/fastapi-langchain-rag
-->

**Keywords:** Vector Database, Vector Search Engine

<!--
brew install pgvector
brew services list
brew services start pgvector
-->

<!--
SELECT * FROM pg_extension WHERE extname = 'vector';

CREATE EXTENSION IF NOT EXISTS vector;
-->

## Links

- [Code Repository](https://github.com/pgvector/pgvector)

<!--
https://github.com/pgvector/pgvector-node
-->

## Glossary

- Retrieval Augmented Generation (RAG)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h pgvector \
  -e POSTGRES_USER='dev' \
  -e POSTGRES_PASSWORD='dev' \
  -e POSTGRES_DB='dev' \
  -v pgvector-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name pgvector \
  --network workbench \
  docker.io/pgvector/pgvector:pg17
```

```sh
sudo hostess add pgvector 127.0.0.1
```

```env
DATABASE_URL=postgresql://dev:dev@127.0.0.1:5432/dev
```

### Query

```sh
docker exec -i postgresql psql -U postgres <<-EOSQL

EOSQL
```

### Remove

```sh
docker rm -f pgvector

docker volume rm pgvector-data
```
