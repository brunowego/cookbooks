# Prisma

<!--
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
-->

## Links

- [Code Repository](https://github.com/prisma/prisma)
- [Main Website](https://prisma.io/)

## Guides

- [Concepts / Components / Prisma Data Platform](https://prisma.io/docs/concepts/components/prisma-data-platform)

## Library

### Installation

#### NPM

```sh
npm install @prisma/client
```

### Tips

#### Visual Studio Code

```sh
code --install-extension Prisma.prisma
```

#### Faker

Save in `./db/seed.js`:

```js
const { PrismaClient } = require('@prisma/client')
const { lorem } = require('faker')

const prisma = new PrismaClient()

const seed = async () => {
  const postPromises = []

  new Array(50).fill(0).forEach((_) => {
    postPromises.push(
      prisma.post.create({
        data: {
          title: lorem.sentence(),
        },
      })
    )
  })

  const posts = await Promise.all(postPromises)

  console.log(posts)
}

seed()
  .catch((err) => {
    console.error(err)
    process.exit(1)
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
```

Save in `./package.json`:

```json
{
  // ...
  "prisma": {
    "seed": "node ./db/seed.js"
  }
}
```

```sh
npx prisma db seed
```

<!-- #### [Named Constraints](https://prisma.io/docs/guides/upgrade-guides/upgrading-versions/upgrading-to-prisma-3/named-constraints)

```prisma
generator client {
  previewFeatures = ["namedConstraints"]
}
```

```sql
SELECT con.conname
FROM pg_catalog.pg_constraint con
  INNER JOIN pg_catalog.pg_class rel
    ON rel.oid = con.conrelid
  INNER JOIN pg_catalog.pg_namespace nsp
    ON nsp.oid = connamespace
WHERE nsp.nspname = 'public'
AND rel.relname = 'post';
``` -->

#### PlanetScale

<!--
initial-setup
shadow

SHADOW_DATABASE_URL
-->

```prisma
generator client {
  provider        = "prisma-client-js"
  previewFeatures = ["referentialIntegrity"]
}

datasource db {
  provider             = "mysql"
  url                  = env("DATABASE_URL")
  shadowDatabaseUrl    = env("SHADOW_DATABASE_URL")
  referentialIntegrity = "prisma"
}
```

## CLI

### Installation

#### NPM

```sh
npm install @prisma/cli -D
```

### Commands

```sh
npx prisma -h
```

### Initialize

```sh
npx prisma init --datasource-provider mysql
# or
npx prisma init --url mysql://[username]:[password]@localhost:3306/[database]
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

### Usage

```sh
#
npx prisma db pull

#
npx prisma db push

#
npx prisma generate

#
npx prisma migrate dev --name init

#
npx prisma format

#
npx prisma migrate deploy
```

## Studio

### Installation

#### Homebrew

```sh
brew install --cask prisma-studio
```

### Usage

```sh
#
npx prisma studio
```
