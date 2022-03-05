# Planetscale


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
