# WAHA Plus

<!--
https://github.com/search?q=path%3Adocker-compose.y+content%3Adevlikeapro%2Fwaha&type=code
-->

<!--
# Docs

https://github.com/devlikeapro/waha-docs/blob/main/content/docs/how-to/security/index.md?plain=1
https://waha.devlike.pro/blog/waha-scaling-how-to-handle-500-sessions
-->

<!--
DBeaver: Select to show all databases
-->

## Links

- [Portal](https://portal.devlike.pro/login)
- Code Repository
  - [WAHA Plus](https://github.com/devlikeapro/waha-plus)
  - [GOWS Plus](https://github.com/devlikeapro/gows-plus)
  - [WAHA Hub UI](https://github.com/devlikeapro/waha-hub/tree/main/ui)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Pull

```sh
#
export DOCKER_RUN_OPTS='--platform linux/amd64'

#
docker pull $(echo "$DOCKER_RUN_OPTS") \
  docker.io/devlikeapro/waha-plus:latest

#
docker pull $(echo "$DOCKER_RUN_OPTS") \
  docker.io/devlikeapro/waha-plus:gows-2026.3.4
```

### Running

```sh
#
docker login -u devlikeapro -p <token> # https://portal.devlike.pro

#
export DOCKER_RUN_OPTS='--platform linux/amd64'

#
export WAHA_API_KEY='admin'

#
echo "$WAHA_API_KEY"

#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h waha-plus \
  -e WAHA_API_KEY="$WAHA_API_KEY" \
  -e WHATSAPP_SESSIONS_POSTGRESQL_URL=postgres://postgres:postgres@localhost:5432/postgres?sslmode=disable \
  -e WAHA_MEDIA_STORAGE=S3 \
  -e WAHA_S3_REGION=eu-west-1 \
  -e WAHA_S3_BUCKET=waha \
  -e WAHA_S3_ACCESS_KEY_ID=minioadmin \
  -e WAHA_S3_SECRET_ACCESS_KEY=minioadmin \
  -e WAHA_S3_ENDPOINT=http://127.0.0.1:9000 \
  -e WAHA_S3_FORCE_PATH_STYLE=True \
  -e WAHA_S3_PROXY_FILES=False \
  -p 13000:3000 \
  --name waha-plus \
  docker.io/devlikeapro/waha-plus:gows

#
docker logout
```

<!--
- WAHA_DASHBOARD_USERNAME=admin
- WAHA_DASHBOARD_PASSWORD=admin
- WHATSAPP_DEFAULT_ENGINE=WEBJS
- WAHA_PRINT_QR=False
- WAHA_MEDIA_STORAGE=LOCAL
- WHATSAPP_FILES_LIFETIME=0
- WHATSAPP_FILES_FOLDER=/app/.media
-->

```sh
#
echo -e '[INFO]\thttp://127.0.0.1:13000'
echo -e '[INFO]\thttp://127.0.0.1:13000/dashboard'

#
curl -X GET http://127.0.0.1:13000/health
```

### Remove

```sh
docker rm -f waha-plus
```
