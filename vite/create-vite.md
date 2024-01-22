# Create Vite App

## Templates

| JavaScript | TypeScript   |
| ---------- | ------------ |
| `vanilla`  | `vanilla-ts` |
| `vue`      | `vue-ts`     |
| `react`    | `react-ts`   |
| `preact`   | `preact-ts`  |
| `lit`      | `lit-ts`     |
| `svelte`   | `svelte-ts`  |

## Usage

```sh
# Using pnpm
pnpm create vite <app-name> --template react-ts

# Using Bun
bun create vite <app-name> --template react-ts
```

## Issues

### Max Old Space Size

```log
FATAL ERROR: Reached heap limit Allocation failed - JavaScript heap out of memory
```

```sh
export NODE_OPTIONS='--max-old-space-size=2048'
```

### TBD

```log
Cannot find module './App.vue' or its corresponding type declarations. ts(2307)
```

TODO

<!-- ## Dockerfile

```Dockerfile
FROM docker.io/library/node:18.12-alpine

WORKDIR /app

COPY ./package.json ./yarn.lock ./

RUN yarn install && \
      yarn cache clean

COPY ./ ./

RUN yarn build

EXPOSE 1337

CMD ["yarn", "start"]
``` -->
