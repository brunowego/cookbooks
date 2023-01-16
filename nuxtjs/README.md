# NuxtJS

## Links

- [Code Repository](https://github.com/nuxt/nuxt.js)
- [Main Website](https://nuxtjs.org/)

## Project

### Initialize

```sh
yarn create nuxt-app <name>
# or
npm init nuxt-app <name>
```

### Commands

```sh
npx nuxt -h
```

### Usage

```sh
#
yarn dev

#
yarn generate

#
yarn start

#
yarn build
```

### Tips

#### Dynamic Backend URL

```sh
if [ -n "${BACKEND_URL}" ]; then
    for file in `grep -lrnw ./_nuxt -e 'http://127.0.0.1:8092'`; do
        sed -i "s#http://127.0.0.1:8092#$BACKEND_URL#g" $file
    done
fi
```

```sh
: "${BACKEND_URL:?Not set in environment}"

for file in `grep -lrnw ./_nuxt -e 'http://127.0.0.1:8092'`; do
    sed -i "s#http://127.0.0.1:8092#$BACKEND_URL#g" $file
done
```

#### [Load System Variables](https://github.com/nuxt-community/dotenv-module#systemvars)

```js
export default {
  env: {
    BASE_URL: process.env.BASE_URL,
  },

  // ...

  buildModules: [
    ['@nuxtjs/dotenv', { systemvars: true }],
    // ...
  ],

  // ...
}
```
