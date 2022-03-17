# Seed

<!--
import { Prisma } from '@prisma/client'

export const USERS: {
  email: string
  username: string
  rates: Prisma.JsonArray
}[] = [
  {
    email: 'admin@example.com',
    username: 'admin',
    rates: ['0.045196', '0.045174'],
  },
]
-->

## Dependencies

- [Prisma](/prisma/README.md#library)

## Schema Example

```prisma
// ...

model Post {
  id        String   @id @default(uuid())
  title     String   @unique @db.VarChar(100)
  body      String   @db.Text
  createdAt DateTime @default(now()) @map("created_at") @db.Timestamp
  updatedAt DateTime @default(now()) @map("updated_at") @db.Timestamp

  tags TagsOnPosts[]

  @@map("posts")
}

model Tag {
  id        String   @id @default(uuid())
  name      String   @unique @db.VarChar(20)
  colorCode String?  @map("color_code") @db.Char(6)
  createdAt DateTime @default(now()) @map("created_at") @db.Timestamp

  posts TagsOnPosts[]

  @@map("tags")
}

model TagsOnPosts {
  post   Post   @relation(fields: [postId], references: [id], onDelete: Cascade)
  postId String @map("post_id")
  tag    Tag    @relation(fields: [tagId], references: [id], onDelete: Cascade)
  tagId  String @map("tag_id")

  @@id([postId, tagId])
  @@map("posts_tags")
}
```

## Seeding

### Static

TODO

<!-- **Refer:** `./db/prisma/seed.ts`:

```ts

```

**Refer:** `./db/data.ts`:

```ts
export const posts = []
``` -->

### Dynamic

#### Dependencies

```sh
# Using NPM
npm install @faker-js/faker ts-node --save-dev

# Using Yarn
yarn add @faker-js/faker ts-node --dev
```

#### Configuration

**Refer:** `./db/prisma/data/index.ts`:

```ts
export { posts } from './posts'
export { tags } from './tags'
```

**Refer:** `./db/prisma/data/posts.ts`:

```ts
import { Post } from '@prisma/client'
import { faker } from '@faker-js/faker'
import slugify from 'slugify'

export const posts: Pick<Post, 'title' | 'slug' | 'body'>[] = [...Array(10)]
  .map(() => {
    const draftPostTitle = faker.lorem.words(3)
    const draftPostSlug = slugify(draftPostTitle, { lower: true })

    return {
      title: draftPostTitle,
      slug: draftPostSlug,
      body: faker.lorem.paragraphs(2),
    }
  })
  .concat({
    title: 'Next.js with Prisma and GraphQL',
    slug: 'nextjs-with-prisma-graphql',
    body: faker.lorem.paragraphs(2),
  })
```

**Refer:** `./db/prisma/data/tags.ts`:

```ts
import { Tag } from '@prisma/client'
import { faker } from '@faker-js/faker'

export const tags: Pick<Tag, 'name' | 'colorCode'>[] = [...Array(10)].map((_) => ({
  name: faker.commerce.product(),
  colorCode: faker.internet.color().replace('#', ''),
}))
```

**Refer:** `./db/prisma/helpers/index.ts`:

```ts
export { randInt } from './randInt'
```

**Refer:** `./db/prisma/helpers/randInt.ts`:

```ts
export const randInt = (min: number, max: number) =>
  Math.floor(Math.random() * (max - min + 1)) + min
```

**Refer:** `./db/prisma/tasks/reset.ts`:

```ts
import { prisma } from '../../../src/lib/prisma'

async function main() {
  await Promise.all([
    await prisma.tagsOnPosts.deleteMany(),
    await prisma.post.deleteMany(),
    await prisma.tag.deleteMany(),
  ])
}

main()
  .catch((err) => {
    console.error(err)

    process.exit(1)
  })
  .finally(() => prisma.$disconnect())
```

**Refer:** `./db/prisma/tasks/seed.ts`:

```ts
import { posts, tags } from '../data'
import { prisma } from '../../../src/lib/prisma'
import { randInt } from '../helpers'

async function main() {
  // eslint-disable-next-line no-console
  console.log('Start seeding ...')

  await Promise.all([
    posts.map(
      async (data) =>
        await prisma.post
          .upsert({
            where: {
              title: data.title,
            },
            update: {},
            create: data,
          })
          .catch(() => {})
    ),
    tags.map(
      async (data) =>
        await prisma.tag
          .upsert({
            where: {
              name: data.name,
            },
            update: {},
            create: data,
          })
          .catch(() => {})
    ),
  ])

  const postIds = (await prisma.post.findMany()).map((post) => post.id)
  const tagIds = (await prisma.tag.findMany()).map((tag) => tag.id)

  for (const _ in [...Array(60)].map((i) => i)) {
    await prisma.tagsOnPosts
      .create({
        data: {
          postId: postIds[randInt(0, postIds.length)],
          tagId: tagIds[randInt(0, tagIds.length)],
        },
      })
      .catch(() => {})
  }

  // eslint-disable-next-line no-console
  console.log('Seeding finished.')
}

main()
  .catch((err) => {
    console.error(err)

    process.exit(1)
  })
  .finally(() => prisma.$disconnect())
```

**Refer:** `./src/lib/prisma.ts`

```ts
import { PrismaClient } from '@prisma/client'

declare global {
  var prisma: PrismaClient | undefined
}

export const prisma =
  global.prisma ||
  new PrismaClient({
    log: ['query', 'error', 'warn'],
  })

if (process.env.NODE_ENV !== 'production') global.prisma = prisma
```

**Refer:** `./package.json`:

```json
{
  // ...
  "scripts": {
    "db:seed": "ts-node ./db/prisma/tasks/seed.ts",
    "db:reset": "ts-node ./db/prisma/tasks/reset.ts",
    // ...
  },
  // ...
}
```

**Refer:** `./tsconfig.json`

```json
{
  // ...
  "ts-node": {
    "compilerOptions": {
      "module": "commonjs"
    }
  },
  // ...
}
```

```sh
#
npx prisma db push
yarn dlx prisma db push

#
npm run db:seed
yarn db:seed

#
npm run db:reset
yarn db:reset

#
npx prisma studio
yarn dlx prisma studio
```
