# Strapi

<!--
https://github.com/Okampus/okampus/tree/dev/apps/strapi

https://github.com/SocialGouv/mda/tree/main/packages/strapi-types

Port 1337
-->

**Keywords:** [Headless CMS](/headless-cms.md)

## Links

- [Code Repository](https://github.com/strapi/strapi)
- [Main Website](https://strapi.io/)
- [Command Line Interface (CLI)](https://docs.strapi.io/developer-docs/latest/developer-resources/cli/CLI.html)
- [Plugins](https://docs.strapi.io/developer-docs/latest/plugins/plugins-intro.html)

## CLI

### Installation

```sh
# Using NPM
npm install @strapi/strapi -g

# Using Yarn 1.x
yarn global add @strapi/strapi
```

### Commands

```sh
# Using NPX
npx @strapi/strapi -h

# Using Local
strapi -h
```

### Bootstrap

```sh
#
mkdir ./cms && "$_"

#
strapi new ./ \
  --no-run \
  --quickstart \
  -ts

#
strapi new ./ \
  --no-run \
  --dbclient 'postgres' \
  --dbhost '127.0.0.1' \
  --dbport '5432' \
  --dbname 'dev' \
  --dbusername 'user' \
  --dbpassword 'pass' \
  --dbssl=false \
  -ts
```

### Configuration

```sh
#
strapi admin:create-user \
  -f 'John' \
  -l 'Doe' \
  -e 'johndoe@xyz.tld' \
  -p 'Pa$$w0rd!'

#
strapi telemetry:disable

#
strapi ts:generate-types -s
```

<!--
./config/plugins.ts

https://github.com/artu43/mono-ecommerce/tree/master/apps/api/config
-->

### Usage

```sh
#
strapi develop \
  --watch-admin \
  --browser=false

#
strapi watch-admin \
  --browser=false

#
strapi start

#
strapi console

#
strapi build
```

#### List

```sh
#
strapi routes:list

#
strapi policies:list

#
strapi middlewares:list

#
strapi content-types:list

#
strapi hooks:list

#
strapi controllers:list

#
strapi services:list
```

### Plugin

```sh
#
strapi install <name>

#
strapi install documentation
strapi install i18n
strapi install graphql

#
strapi uninstall <name>
```

### Generate

```sh
#
strapi generate -h

#
strapi generate policy <name>
strapi generate policy isAuthenticated

#
strapi generate controller <name>

#
strapi generate plugin <name>

#
strapi generate api <name>
echo 'n' | strapi generate api faq
echo 'n' | strapi generate api post
echo 'n' | strapi generate api product

#
strapi generate service <name>

#
strapi templates:generate ./
```

### Tips

#### Enable Telemetry

```sh
#
strapi telemetry:enable
```

#### Configuration Dump/Restore

```sh
#
strapi config:dump -f ./dump.json

#
strapi config:restore \
  -f ./dump.json \
  -s replace
```

### Reset Admin User Password

```sh
#
strapi admin:reset-user-password \
  -e <email> \
  -p <password>
```

## Dockerfile

```Dockerfile
FROM docker.io/strapi/base:14-alpine

WORKDIR /usr/src/app

COPY ./package.json ./yarn.lock ./

RUN yarn install && \
      yarn cache clean

COPY ./ ./

RUN yarn build

EXPOSE 1337

CMD ["yarn", "start"]
```
