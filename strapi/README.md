# Strapi

<!--
https://github.com/Okampus/okampus/tree/dev/apps/strapi

Port 1337
-->

**Keywords:** [Headless CMS](/headless-cms.md)

## Links

- [Code Repository](https://github.com/strapi/strapi)
- [Main Website](https://strapi.io/)

## CLI

### Installation

#### NPM

```sh
npm install strapi --save
```

### Commands

```sh
npx strapi -h
```

### Usage

```sh
#
npx strapi develop

#
npx strapi start

#
npx strapi build

#
npx strapi console
```

## Dockerfile

```Dockerfile
FROM docker.io/strapi/base:14-alpine

WORKDIR /usr/src/app

COPY ./package.json ./
COPY ./yarn.lock ./

RUN yarn install && \
      yarn cache clean

COPY ./ ./

RUN yarn build

EXPOSE 1337

CMD ["yarn", "start"]
```
