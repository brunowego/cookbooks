# Umami

<!--
https://github.com/fabianmakila/Hangar/blob/staging/frontend/src/composables/useTracking.ts
-->

## Links

- [Code Repository](https://github.com/umami-software/umami)
- [Main Website](https://umami.is)
- Docs
  - [Running on Vercel](https://umami.is/docs/guides/running-on-vercel)

<!--
https://github.com/TheMath123/my-portfolio/blob/main/src/lib/umami.ts
https://github.com/animuslabs/fiddl-ui/blob/main/src/lib/umami.ts
-->

<!--
{process.env.NEXT_PUBLIC_UMAMI_URL && (
  <Script
    async
    defer
    src={`${process.env.NEXT_PUBLIC_UMAMI_URL}/script.js`}
    data-website-id={`${process.env.NEXT_PUBLIC_UMAMI_WEBSITE_ID}`}
  />
)}

{process.env.NEXT_PUBLIC_UMAMI_WEBSITE_ID && (
  <Script
    src="https://analytics.eu.umami.is/script.js"
    data-website-id={process.env.NEXT_PUBLIC_UMAMI_WEBSITE_ID}
    strategy="lazyOnload"
  />
)}

<Script src={NEXT_PUBLIC_UMAMI_URL} data-website-id={NEXT_PUBLIC_UMAMI_WEBSITE_ID} />
-->

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
  -h postgres \
  -v umami-postgres-data:/var/lib/postgresql/data \
  -e POSTGRES_USER='umami' \
  -e POSTGRES_PASSWORD='umami' \
  -e POSTGRES_DB='umami' \
  -p 5432:5432 \
  --name umami-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h umami \
  -e DATABASE_TYPE='postgresql' \
  -e DATABASE_URL='postgresql://umami:umami@umami-postgres:5432/umami' \
  -e APP_SECRET='S3cr3t_K@Key' \
  -p 3000:3000 \
  --name umami \
  --network workbench \
  ghcr.io/umami-software/umami:postgresql-v2.13.2
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:3000'
```

| Login   | Password |
| ------- | -------- |
| `admin` | `umami`  |

### Remove

```sh
docker rm -f umami-postgres umami
docker volume rm umami-postgres-data
```
