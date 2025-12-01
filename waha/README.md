# WAHA

<!--
Waiting for this message. This may take a while.
-->

<!--
Drizze ORM Schema

https://github.com/yansircc/text2sql-demo/blob/main/src/server/db/schema.ts
-->

<!--
https://github.com/AstraOnlineWeb/astracampaign
https://github.com/mikig28/Synapse
-->

<!--
http://localhost:13002/-json
-->

<!--
https://github.com/search?q=path%3Aapi%20path%3Aroute.ts%20content%3Awaha&type=code
-->

<!--
https://github.com/RajaPrasetya/whatsapp-autoreply
https://github.com/PedroMGSilva/futebolada/blob/main/app/.server/waha/client.ts
https://github.com/dittorahmat/waha-gateway/tree/main

https://github.com/hambrianglory/community-fee-management/blob/main/src/lib/whatsappService.ts

https://github.com/wilsonguimaraesrock/modular-crm-pilot
-->

<!--
https://github.com/MajidRaimi/waha-sdk
https://github.com/ariaseta/waha.js
-->

**Keywords:** WhatsApp HTTP API (REST API)

## Links

- Code Repository
  - [WAHA](https://github.com/devlikeapro/waha)
  - [WAHA Plus](https://github.com/devlikeapro/waha-plus)
- [Portal](https://portal.devlike.pro)
- Docs
  - [Security](https://waha.devlike.pro/docs/how-to/security)

<!--
https://waha.devlike.pro/support-us
-->

<!--
## Learn

https://www.youtube.com/watch?v=6wuzYsYSEAY

https://dev.to/waha/waha-scaling-how-to-handle-500-whatsapp-sessions-3fie
https://waha.devlike.pro/docs/how-to/observability/
-->

## Engines

- [GOWS](https://waha.devlike.pro/docs/engines/gows)
- [NOWEB](https://waha.devlike.pro/docs/engines/noweb)
- [VENOM](https://waha.devlike.pro/docs/engines/venom)
- [WebJS](https://waha.devlike.pro/docs/engines/webjs)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
export DOCKER_RUN_OPTS='--platform linux/amd64'

docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h waha \
  -p 3000:3000 \
  --name waha \
  docker.io/devlikeapro/waha
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:3000'
```

<!--
http://localhost:3000/dashboard
http://localhost:3000/dashboard/event-monitor
-->

### Issues

#### TBD

```log
Cannot read properties of null (reading 'screenshot')
```

<!--
https://github.com/devlikeapro/waha/issues/538
https://github.com/devlikeapro/waha/issues/967
https://github.com/devlikeapro/waha/issues/1071
-->

TODO

### Remove

```sh
docker rm -f waha
```
