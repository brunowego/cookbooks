# Prisma

**Keywords:** ORM

<!--
PRISMA_CLI_BINARY_TARGETS='debian-openssl-3.0.x'

https://github.com/charmverse/app.charmverse.io/blob/main/prisma/schema.prisma
https://github.com/podkrepi-bg/api/tree/master/db/seed
-->

<!--
POSTGRES_URL=
POSTGRES_PRISMA_URL=
POSTGRES_URL_NON_POOLING=
-->

## Links

- [Code Repository](https://github.com/prisma/prisma)
- [Main Website](https://prisma.io/)
- [Prisma Data Platform](https://cloud.prisma.io/)
- [Ask Me Anything](https://ama-prisma.vercel.app/)

## Docs

- [Concepts / Components / Prisma Data Platform](https://prisma.io/docs/concepts/components/prisma-data-platform)
- [Guides / Database / Multi-schema](https://prisma.io/docs/guides/database/multi-schema)

### Guides

- [Example projects](https://prisma.io/docs/about/prisma/example-projects)
  - [Code Repository](https://github.com/prisma/prisma-examples/tree/latest)

## Tools

- [Prisma Schema Builder](https://github.com/albingroen/prismabuilder.io)
- [SQL To Prisma Schema Generator](https://sql-to-prisma.vercel.app)
- [EverSQL / SQL To Prisma](https://eversql.com/sql-to-prisma)

## Terms

- Schema Definition Language (SDL)

## Library

### Links

- [Main Website](https://prisma.io/client)

### Installation

```sh
# Using NPM
npm install @prisma/client
npm install prisma --save-dev

# Using Yarn
yarn add @prisma/client
yarn add prisma --dev

# Using pnpm
pnpm add @prisma/client
pnpm add prisma -D
```

### Initialize

```sh
#
npx prisma init --datasource-provider postgresql

#
yarn dlx prisma init --datasource-provider postgresql

#
pnpx prisma init --datasource-provider postgresql
```

### Configuration

```sh
#
mkdir -p ./db && mv ./prisma ./db/prisma
```

**Refer:** `./package.json`:

```json
{
  // ...
  "scripts": {
    "db:validate": "prisma validate",
    "db:generate": "prisma generate",
    "db:generate:watch": "pnpm db:generate --watch",
    "db:push": "prisma db push --skip-generate"
  },
  // ...
  "prisma": {
    "schema": "./db/prisma/schema.prisma"
  }
  // ...
}
```

<!--
"db:dev": "prisma migrate dev",
"db:migrate": "env-cmd -f .env.production.local prisma migrate deploy",
-->

### Using

```sh
# With pnpm
pnpm db:push
# or
pnpm run db:push -- --accept-data-loss
```

### Extend With

#### Prettier

- [Dependency](/prettier.md#library)

```sh
# Using NPM
npm install prettier-plugin-prisma --save-dev

# Using Yarn
yarn add prettier-plugin-prisma --dev

# Using pnpm
pnpm add prettier-plugin-prisma -D
```

**Refer:** `./prettier.config.cjs`

```cjs
/**
 * @type { import('prettier').Options }
 */
const prettierConfig = {
  // ...
  plugins: [require('prettier-plugin-prisma')],
}

module.exports = prettierConfig
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension Prisma.prisma

#
jq '."recommendations" += ["prisma.prisma"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

**Configuration:**

```sh
#
jq '."[prisma]"."editor.defaultFormatter" |= "Prisma.prisma"' "$PWD"/.vscode/settings.json | sponge "$PWD"/.vscode/settings.json
```

### Issues

#### Missing Direct Connection

```log
Database error. error code: unknown, error message: Server selection timeout: No available servers. Topology: { Type: ReplicaSetNoPrimary, Servers: [ ] }
```

Add `&directConnection=true` to `DATABASE_URL`.

#### Missing Replica Set

```log
Prisma needs to perform transactions, which requires your MongoDB server to be run as a replica set. https://pris.ly/d/mongodb-replica-set
```

Add `&replicaSet=rs0` to `DATABASE_URL`.

<!--
DATABASE_URL=mongodb://dev:dev@localhost/dev?authSource=admin&replicaSet=rs0
-->

#### Unnecessary Declaration Property

```log
@acme/api:dev: src/modules/user/user.service.ts:14:9 - error TS2742: The inferred type of 'list' cannot be named without a reference to '../../../../../packages/db/node_modules/@prisma/client/runtime'. This is likely not portable. A type annotation is necessary.
```

Remove `"declaration": true` and `"declarationMap": true` in `./tsconfig.json`.

#### TBD

```log
error TS2339: Property 'user' does not exist on type 'PrismaService'.
```

Try clean dist (build) folders and rebuild.

#### Wrong Encryption

```log
Error opening a TLS connection: The TLS settings didn't allow the connection to be established. Please review your connection string. (error: error:1416F086:SSL routines:tls_process_server_certificate:certificate verify failed:ssl/statem/statem_clnt.c:1921: (unable to get local issuer certificate))
```

Set `encrypt` to `DANGER_PLAINTEXT`:

```env
DATABASE_URL=sqlserver://<host>:1433;database=<databsae>;user=<username>;password=<password>;encrypt=DANGER_PLAINTEXT
```

#### Missing `node_modules` Binary Path

```log
Error: Generator at prisma-dbml-generator could not start:

/bin/sh: prisma-dbml-generator: command not found
```

```sh
# Try use with `npx` instead of `yarn dlx`
npx prisma generate
```

#### Missing Path Include

```log
Error: Cannot find module '@/lib/prisma'
```

Try change to a relative path reference, like `../../../src/lib/prisma`.

#### Missing Types

```log
Parameter 'tag' implicitly has an 'any' type. ts(7006)
```

```sh
npx prisma generate
```

## CLI

### Commands

```sh
#
npx prisma -h

#
yarn dlx prisma -h
```

### Usage

```sh
#
npx prisma format

#
npx prisma db pull

#
npx prisma db push --skip-generate
npx prisma db push --force-reset

#
npx prisma generate

#
npx prisma db seed

#
npx prisma migrate dev --name 'init'
echo 'y' | npx prisma migrate dev --name 'init'
npx prisma migrate dev --preview-feature

#
npx prisma migrate deploy

#
npx prisma studio

#
echo 'USE develop; DROP DATABASE <db-name>;' | \
  npx prisma db execute --stdin
```
