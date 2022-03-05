# Seed

## Schema

TBD

## Static

**Refer:** `./db/prisma/seed.ts`:

```ts

```

**Refer:** `./db/data.ts`:

```ts
export const posts = []
```

## Dynamic

### Dependencies

```sh
# Using NPM
npm install @faker-js/faker ts-node --save-dev

# Using Yarn
yarn add @faker-js/faker ts-node --dev
```

### Configuration

**Refer:** `./db/data/posts.ts`:

```ts

```

**Refer:** `./db/prisma/seed.ts`:

```ts

```

**Refer:** `./package.json`:

```json
{
  // ...
  "scripts": {
    "db:reset": "ts-node ./db/prisma/tasks/reset.ts"
  },
  // ...
  "prisma": {
    // ...
    "seed": "ts-node ./db/prisma/tasks/seed.ts"
  }
}
```

```sh
#
npx prisma db push

#
npm run db:seed
yarn db:seed

#
npm run db:reset
yarn db:reset

#
npx prisma studio
```
