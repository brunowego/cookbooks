# Prisma

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
npx prisma init --datasource-provider postgresql
```

### Configuration

```sh
#
mkdir -p ./db && mv ./prisma ./db
```

**Refer:** `./package.json`:

```json
{
  // ...
  "prisma": {
    "schema": "./db/prisma/schema.prisma"
  }
}
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

## CLI

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
npx prisma db seed

#
npx prisma generate

#
npx prisma migrate dev --name init
npx prisma migrate dev --preview-feature

#
npx prisma migrate deploy

#
npx prisma studio
```
