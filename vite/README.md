# Vite

<!--
https://github.com/search?o=desc&q=filename%3Apackage.json+%22vite%22+%22tailwindcss%22+%22typescript%22+path%3Aapps&s=indexed&type=Code

https://dev.to/wojtekmaj/migrating-your-react-app-from-webpack-to-vite-inp

https://github.com/haishanh/cherry
https://github.com/rayriffy/rayriffy-h
https://github.com/satyatiwar/satyam
-->

## Links

- [Code Repository](https://github.com/vitejs/vite)
- [Main Website](https://vitejs.dev)
- [Configuring Vite](https://vitejs.dev/config/)

## Related

- [Rollup](/rollup.md)

## Glossary

- Hot Module Replacement (HMR)

## Tools

- [Vite Rollup Plugins](https://vite-rollup-plugins.patak.dev)

## Project

### Templates

| JavaScript | TypeScript   |
| ---------- | ------------ |
| `vanilla`  | `vanilla-ts` |
| `vue`      | `vue-ts`     |
| `react`    | `react-ts`   |
| `preact`   | `preact-ts`  |
| `lit`      | `lit-ts`     |
| `svelte`   | `svelte-ts`  |

### Bootstrap

```sh
# Using NPM
npm create vite@latest
# or
npm create vite@latest <app-name> -- --template <name>

# Using Yarn
yarn create vite
# or
yarn create vite <app-name> --template <name>

# Using pnpm
pnpm create vite
# or
pnpm create vite <name> --template <name>
```

### Issues

#### Max Old Space Size

```log
FATAL ERROR: Reached heap limit Allocation failed - JavaScript heap out of memory
```

```sh
export NODE_OPTIONS='--max-old-space-size=2048'
```

#### TBD

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
