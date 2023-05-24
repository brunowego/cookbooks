# Prisma

<!--
https://github.com/withbeacon/beacon/blob/main/apps/web/next.config.mjs#L9
https://github.com/t3-oss/create-t3-turbo/blob/main/apps/nextjs/next.config.mjs#L11
-->

## Dependencies

- [Prisma](/prisma/README.md#library)
- [Prisma / Seed](/prisma/extend/seed.md)

## Issues

### Using Prisma Client in a Next.js project in a monorepo setup

```log
Error: Your schema.prisma could not be found, and we detected that you are using Next.js.
Find out why and learn how to fix this: https://pris.ly/d/schema-not-found-nextjs
```

Thus this [solution here](https://www.prisma.io/docs/guides/other/troubleshooting-orm/help-articles/nextjs-prisma-client-monorepo).
