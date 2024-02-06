# Extend with Docker

<!--
https://github.com/haishinio/haishin/blob/main/apps/frontend/Dockerfile
https://github.com/haishinio/haishin/blob/main/apps/backend/Dockerfile
https://github.com/romhml/k2/blob/main/apps/web/Dockerfile
https://github.com/Nyumat/dove/blob/main/apps/api/Dockerfile
https://github.com/maderwin/atlas/blob/main/Dockerfile
https://github.com/iangregson/web-crawler/blob/main/Dockerfile
-->

## Configuration

```sh
#
bun install --yarn

# or
cat << EOF >> ./bunfig.toml
[install.lockfile]
print = "yarn"
EOF

bun install
```

## Usage

```sh
#
docker build -f ./services/api/Dockerfile -t ghcr.io/acme/api:latest ./

#
docker run -it --name acme-api --rm ghcr.io/acme/api:latest /bin/sh

#
docker run -p 3000:3000 --name acme-api --rm ghcr.io/acme/api:latest
```

## Manifest

TODO

<!-- ```Dockerfile
FROM oven/bun:alpine AS bun


FROM bun AS builder

WORKDIR /app

COPY ./bun.lockb ./package.json ./

RUN bun install --production

COPY ./ ./

RUN bunx turbo run build --filter @acme/api


FROM bun AS runner

WORKDIR /app

COPY --from=builder /app/services/api/server ./
``` -->

### For Monorepo

```Dockerfile
FROM oven/bun:alpine AS bun


FROM bun AS builder

WORKDIR /app

COPY ./ ./

RUN bun install --production

RUN bunx turbo run build --filter @acme/api


FROM bun AS runner

WORKDIR /app

COPY --from=builder /app/services/api/server ./

EXPOSE 3000

CMD ["/server"]
```
