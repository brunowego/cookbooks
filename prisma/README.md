# Prisma

<!--
https://github.com/2color/real-world-grading-app
https://github.com/notiz-dev/prisma-dbml-generator

https://www.youtube.com/watch?v=aim8Mk-ETK0
https://www.youtube.com/watch?v=-oRbc1Efz5Q
https://www.youtube.com/watch?v=iH7VYDeokCk
https://www.youtube.com/watch?v=Uqg7Q4tYwno
https://www.youtube.com/watch?v=YqBG5rFP4Ic
https://www.youtube.com/watch?v=-_GZJ3xwYOw
https://www.youtube.com/watch?v=Uy0gwNh3nKQ
https://www.youtube.com/watch?v=4oDK-7-aSY0
https://www.youtube.com/watch?v=lddaR8Y-gko
https://www.youtube.com/watch?v=oj2xyW55d9M
https://www.youtube.com/watch?v=ULB6o6XZNTY
https://github.com/calendso/calendso/blob/main/prisma/schema.prisma
https://github.com/email2vimalraj/food-pos-app/blob/main/prisma/schema.prisma
https://github.com/Rowan-Paul/project-argus/blob/main/prisma/schema.prisma
https://github.com/kimf/tisdagsgolfen-prisma3
https://github.com/kuc-arc-f/headless-3-mysql
https://github.com/2wce/prisma-template
https://github.com/m-abdelwahab/course-platform
https://www.prisma.io/blog/announcing-upcoming-course-8s41wdqrlgc7

Prisma Data Proxy

"db:generate": "prisma generate",
"db:push": "prisma db push",
"db:seed": "prisma db seed",
"db:static-data": "ts-node src/db/createStaticData && eslint --fix src/web/staticData.ts && prettier --write src/web/staticData.ts",
"db:sync-dbs": "ts-node src/db/syncProdDevStaticData",
-->

## Links

- [Code Repository](https://github.com/prisma/prisma)
- [Main Website](https://prisma.io/)
- [Prisma Data Platform](https://cloud.prisma.io/)
- [Ask Me Anything](https://ama-prisma.vercel.app/)
- [Example projects](https://prisma.io/docs/about/prisma/example-projects)

## Guides

- [Concepts / Components / Prisma Data Platform](https://prisma.io/docs/concepts/components/prisma-data-platform)

## Terms

- Schema Definition Language (SDL)

## CLI

### Installation

#### NPM

```sh
npm install prisma --save-dev
```

### Initialize

```sh
# Using data-source provider
npx prisma init --datasource-provider postgresql

# Or, using URL
export POSTGRES_HOST='localhost'
export POSTGRES_PORT='5432'
export POSTGRES_USER='user'
export POSTGRES_PASSWORD='pass'
export POSTGRES_DB='dev'

npx prisma init \
  --url "postgresql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@${POSTGRES_HOST}:${POSTGRES_PORT}/${POSTGRES_DB}?schema=public"
```

### Configuration

```sh
#
mv ./prisma ./db
```

Add in `./package.json`:

```json
{
  // ...
  "prisma": {
    "schema": "./db/schema.prisma"
  }
}
```

### Commands

```sh
npx prisma -h
```

### Usage

```sh
#
npx prisma db pull

#
npx prisma db push --skip-generate

#
npx prisma format

#
npx prisma generate

#
npx prisma migrate dev --name init

#
npx prisma migrate deploy
```
