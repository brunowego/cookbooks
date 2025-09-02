# WAHA Plus

<!--
https://github.com/search?q=path%3Adocker-compose.y+content%3Adevlikeapro%2Fwaha&type=code
-->

<!--
# Docs

https://github.com/devlikeapro/waha-docs/blob/main/content/docs/how-to/security/index.md?plain=1
-->

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
#
docker login -u devlikeapro -p <token>

#
docker pull docker.io/devlikeapro/waha-plus:gows

#
export DOCKER_RUN_OPTS='--platform linux/amd64'
export WAHA_API_KEY='admin'

#
echo "$WAHA_API_KEY"

#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h waha-plus \
  -e WAHA_API_KEY="$WAHA_API_KEY" \
  -p 13000:3000 \
  --name waha-plus \
  docker.io/devlikeapro/waha-plus:gows
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
