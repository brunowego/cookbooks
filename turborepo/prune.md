# Turborepo Prune

## Links

- [Docs](https://turbo.build/repo/docs/reference/command-line-reference#turbo-prune---scopetarget)

## Usage

```sh
#
pnpm dlx rimraf ./out

#
turbo prune \
  --scope '@<owner>/<name>' \
  --docker

#
pnpm dlx npkill -d ./out
```

```Dockerfile
FROM docker.io/library/node:18.18.0 AS builder

RUN corepack enable pnpm

WORKDIR /app

COPY ./out/json ./out/pnpm-lock.yaml ./

RUN pnpm install --frozen-lockfile

COPY ./out/full ./

# RUN pnpm build --filter @<owner>/<name>


FROM builder AS pruner

RUN pnpm --filter @<owner>/<name> deploy ./pruned

WORKDIR /app/pruned

# RUN pnpm build


FROM cgr.dev/chainguard/node:18.18

USER nobody

ARG TZ

ENV \
  NODE_ENV=production \
  TZ=$TZ

WORKDIR /app

COPY --from=pruner ./app/pruned/.next/standalone ./
COPY --from=pruner ./app/pruned/.next/static ./.next/static
COPY --from=pruner ./app/pruned/public ./public

EXPOSE 3000

CMD ["./server.js"]
```

## Issues

### TBD

```log
15.10  EEXIST  EEXIST: file already exists, symlink '../../bin/esbuild' -> '/backend/node_modules/esbuild_tmp_7/node_modules/.bin/esbuild'
```

TODO

<!-- ```sh
rm -fR ./node_modules/.pnpm/*
``` -->
