# WAHA

<!--
Waiting for this message. This may take a while.
-->

<!--
Text: https://gist.github.com/brunowego/ffe25b1659134d4500e4052297701d94
File: https://gist.github.com/brunowego/22c67976b43135a46e8b3100d1ba2701
Image: https://gist.github.com/brunowego/5a0c846fbe23f1a7cf76f3cbca065638
Video: https://gist.github.com/brunowego/6d3e42a8d54bd02c7e6eea6ea4cb5188
Photo: https://gist.github.com/brunowego/8b376f06fff467f7aad5b0f1ab8c3908
Audio: https://gist.github.com/brunowego/7eec938611c4ea3aef248a3b09018b70
Contact: https://gist.github.com/brunowego/9209bab1e265393d26e0891bd2802187
Poll: https://gist.github.com/brunowego/fc54e6cf6451df5bade3c6e8b99253cd
Event: https://gist.github.com/brunowego/fdbe04d4d28c1d9b0af4b1e0a5fd39f7
New Sticker: https://gist.github.com/brunowego/ffad0be5695f4a6f8a9f062dc3468ffd
Voice Message: https://gist.github.com/brunowego/2a7b534e65a7e4ab88cc8c85430bbc1d
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
Server connection failed
WAHA (https://waha-621359962043.us-east1.run.app) is not connected.
Please make sure it's online and set right API key in the configuration.
```

TODO

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
