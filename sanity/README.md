# Sanity

<!--
https://udemy.com/course/nextjs-with-sanity-cms-serverless-blog-app-w-vercel/

https://youtube.com/watch?v=mx1dbMzd3tU

https://github.com/vofo-no/web/blob/main/apps/studio/schemas/schema.ts
https://github.com/vofo-no/web/blob/main/packages/shared/src/schema.ts

https://github.com/feriekolonien/site

https://github.com/sanity-io/demo-content-planning/blob/main/studio/scripts/generateArticles.js

Structure

https://github.com/darenmalfait/daren.be/blob/main/.github/workflows/release-studio.yml
https://github.com/darenmalfait/daren.be/tree/main/studio

https://github.com/jopesh/homepage/tree/main/studio
-->

**Keywords:** [Headless CMS](/headless-cms.md)

## Links

- [Code Repository](https://github.com/sanity-io/sanity)
- [Main Website](https://sanity.io/)

## Docs

- [Schema Types](https://sanity.io/docs/schema-types)
- [Graph-Relational Object Queries (GROQ)](https://sanity.io/docs/groq)
- [GraphQL](https://sanity.io/docs/graphql)

## CLI

### Commands

```sh
npx @sanity/cli help
```

### Initialize

```sh
#
npx @sanity/cli login

# If not exists
npx @sanity/cli init \
  -y \
  --dataset 'production' \
  --output-path ./studio \
  --template clean \
  --visibility private \
  --create-project '[Name]'

# If exists
npx @sanity/cli projects list

npx @sanity/cli init \
  -y \
  --project '[project-id]' \
  --dataset 'production' \
  --output-path ./studio \
  --template clean \
  --visibility private
```

<!--
--coupon 'cleverprogrammer'
-->

### Dependencies

```sh
# Using NPM
npm install @sanity/cli --save-dev

# Using Yarn
yarn add @sanity/cli --dev
```

### Configuration

```sh
#
git init

#
echo '/node_modules' >> ./.gitignore
```

### Usage

```sh
#
npx @sanity/cli manage

#
npx @sanity/cli start

#
npx @sanity/cli dataset create [name]

#
npx @sanity/cli dataset export 'staging' ./staging.tar.gz

#
npx @sanity/cli dataset import ./staging.tar.gz 'production'

#
npx @sanity/cli deploy

#
npx @sanity/cli logout
```

### Tips

#### CORS origins

1. Project -> API
2. CORS origins -> Add CORS origin
   - Origin: `http://localhost:3000`
   - Credentials: Check "Allow credentials"

#### Visual Studio Code

```sh
#
code --install-extension sanity-io.vscode-sanity

#
jq '."recommendations" += ["sanity-io.vscode-sanity"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

### Issues

#### Brave Shields

Turn Shields "DOWN" for `http://localhost:3333`.

#### Studio Not Found

```log
{"statusCode":404,"error":"Not Found","message":"Studio not found"}
```

Just wait! This process can take a while.
