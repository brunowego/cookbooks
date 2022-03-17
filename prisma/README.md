# Prisma

**Keywords:** ORM

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
```

### Initialize

```sh
#
npx prisma init --datasource-provider postgresql

#
yarn dlx prisma init --datasource-provider postgresql
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
  "prisma": {
    "schema": "./db/prisma/schema.prisma"
  },
  // ...
}
```

### Extend With

#### Prettier

```sh
# Using NPM
npm install prettier-plugin-prisma --save-dev

# Using Yarn
yarn add prettier-plugin-prisma --dev
```

**Refer:** `./prettier.config.cjs`

```cjs
/**
 * @type {import('prettier').Options}
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
jq '."[prisma]"."editor.defaultFormatter" |= "Prisma.prisma"' "$PWD/.vscode/settings.json" | sponge "$PWD/.vscode/settings.json"

jq '."recommendations" += ["prisma.prisma"]' "$PWD/.vscode/extensions.json" | sponge "$PWD/.vscode/extensions.json"
```

### Issues

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
yarn db:seed

#
npx prisma migrate dev --name 'init'
echo 'y' | npx prisma migrate dev --name 'init'
npx prisma migrate dev --preview-feature

#
npx prisma migrate deploy

#
npx prisma studio
```
