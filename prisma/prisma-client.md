# Prisma Client

## Links

- [Main Website](https://prisma.io/client)

## Library

### Dependencies

- [Prisma CLI](/prisma/README.md#cli)

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

Save in `./db/seed.ts`:

```ts
import { PrismaClient } from '@prisma/client'
import { lorem } from 'faker'

const prisma = new PrismaClient()

async function seed() {
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
  .finally(async () => await prisma.$disconnect())
```

Save in `./package.json`:

```json
{
  // ...
  "prisma": {
    "seed": "ts-node ./db/seed.ts"
  }
}
```

```sh
#
npx prisma db seed

#
npx prisma studio
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
