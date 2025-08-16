# Langflow

<!--
@datastax/langflow-client
-->

<!--
FlowBit

https://github.com/Shannuuu2012/flowbit-langflow

WIP

https://github.com/varshith2222/MultiAgent-Insight

Extend

https://github.com/permitio/permit-langflow
https://github.com/Empreiteiro/langflow-factory
-->

<!--
Chat

https://github.com/adityam003/socially
https://github.com/Harsh16Bhardwaj/NyayVaad/blob/main/src/app/api/chat/route.ts
https://github.com/danbakke1/leasedaddy/blob/main/Frontend/app/api/langflow-chat/route.ts
https://github.com/moonixt/Lynxky/blob/main/app/api/chat/route.ts
https://github.com/moonixt/ederin.net/blob/main/app/api/chat/route.ts
https://github.com/crtr0/carter-assistant

Lib

https://github.com/Harsh16Bhardwaj/NyayVaad/blob/main/src/lib/langflow.ts

Others

https://github.com/abhinav-kimothi/Agentic-Workflows

https://github.com/Harsh16Bhardwaj/NyayVaad
https://github.com/AReid987/real-estate-agents
https://github.com/misbahsy/expense-chat
https://github.com/michelderu/agentic-ai-workshop
https://github.com/Daniel-Seredensky/TrecDylanDan
https://github.com/Abdul-Muizz1310/LangFlow-Financial-RAG-Chatbot
-->

<!--
path:docker-compose.y content:langflow
-->

**Keywords:**

## Links

- [Main Website](https://langflow.org)
- [Docker Image](https://hub.docker.com/r/langflowai/langflow)
- Docs
  - [Environment variables](https://docs.langflow.org/environment-variables)

<!--
https://datastax.com
-->

## Learning

- [How to Build an AI Image Generation Agent in Langflow with JigsawStack](https://www.youtube.com/watch?v=EDIUcg7VPWU)

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
  -h postgres \
  -v langflow-postgres-data:/var/lib/postgresql/data \
  -e POSTGRES_USER='langflow' \
  -e POSTGRES_PASSWORD='langflow' \
  -e POSTGRES_DB='langflow' \
  -p 15432:5432 \
  --name langflow-postgres \
  --network workbench \
  docker.io/library/postgres:17.5-alpine

#
export LANGFLOW_SECRET_KEY='crEoqpdtIBhFlKx07f+kqavy3r0T9OKbq9euFxpob0g='
export OPENAI_API_KEY=''

#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h langflow \
  -e LANGFLOW_DATABASE_URL='postgresql://langflow:langflow@langflow-postgres:5432/langflow' \
  -e AUTH_ENABLED=true \
  -e LANGFLOW_AUTO_LOGIN=False \
  -e LANGFLOW_SUPERUSER='admin' \
  -e LANGFLOW_SUPERUSER_PASSWORD='Pa$$w0rd!' \
  -e LANGFLOW_SECRET_KEY="${LANGFLOW_SECRET_KEY}" \
  -e OPENAI_API_KEY="${OPENAI_API_KEY}" \
  -p 17860:7860 \
  --name langflow \
  --network workbench \
  docker.io/langflowai/langflow:1.5.0
```

<!--
LANGFLOW_DEFAULT_FLOWS_PATH: "/app/flows"

-->

```sh
echo -e '[INFO]\thttp://127.0.0.1:17860'
```

### Remove

```sh
docker rm -f langflow-postgres langflow

docker volume rm langflow-postgres-data
```

## App

### Installation

```sh
#
brew install --cask langflow
```
