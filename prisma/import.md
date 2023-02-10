# Prisma Import

## Usage

```sh
#
echo 'DATABASE_URL=postgresql://dev:dev@127.0.0.1:5432/dev' >> ./.env

#
cat << EOF > ./schema.prisma
generator client {
  provider        = "prisma-client-js"
  // previewFeatures = ["multiSchema"]
}

datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")
  // schemas  = ["accounts", "connectors", "payments", "public", "tasks"]
}
EOF

#
npx prisma validate

#
npx prisma db pull
```
