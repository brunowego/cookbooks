# Create Nest App

<!--
https://github.com/royib/clean-architecture-nestJS
-->

<!--
nest-env.d.ts
env.d.ts
-->

## References

- [Configuration Defaults](https://github.com/nestjs/nest-cli/blob/master/lib/configuration/defaults.ts)

## CLI

### Commands

```sh
pnpx @nestjs/cli new -h
```

### Bootstrap

```sh
#
pnpx @nestjs/cli new \
  -gs \
  -l TypeScript \
  -p pnpm \
  --strict \
  ./<api-name>
```

### Configuration

```sh
#
pnpm upgrade
pnpm add webpack -D

#
jq 'del(.jest)' ./package.json | sponge ./package.json
sed -i 's/\^/~/' ./package.json

#
cat << EOF >> ./.gitignore
/coverage
/dist
/node_modules
EOF
```

**Refer:** `./package.json`

```json
{
  // ...
  "scripts": {
    "dev": "nest start -w",
    "dev:debug": "nest start -wd",
    "build": "nest build",
    "start": "nest start",
    "start:prod": "node ./dist/src/main.js",
    "format": "prettier --write \"./src/**/*.ts\" \"./test/**/*.ts\"",
    "lint": "eslint \"./{src,apps,libs,test}/**/*.ts\" --fix",
    "test": "jest",
    "test:watch": "jest --watch",
    "test:cov": "jest --coverage",
    "test:debug": "node --inspect-brk -r tsconfig-paths/register -r ts-node/register ./node_modules/jest/bin/jest.js --runInBand",
    "test:e2e": "TEST_ENV=e2e jest"
  },
  // ...
}
```

**Refer:** `./tsconfig.build.json`

```json
{
  "$schema": "https://json.schemastore.org/tsconfig",
  // ...
}
```

**Refer:** `./tsconfig.json`

```json
{
  "$schema": "https://json.schemastore.org/tsconfig",
  "compilerOptions": {
    // ...
    "baseUrl": "./",
    "paths": {
      "@/*": ["./src/*"]
    },
    // ...
  }
}
```

<!--
https://github.com/nestjs/nest/tree/master/packages/common

https://github.com/afetkargo/backend/tree/main/src/common
-->

<!--
#
mkdir -p ./src/{common,modules}

decorators
enums
exceptions
interfaces
serializer
services
utils

config
constants
filters
guards
logger
providers

types
subscriber

#
yarn add @nestjs/common @nestjs/core @nestjs/platform-express reflect-metadata rxjs

#
yarn add @nestjs/cli @nestjs/schematics typescript --dev

#
cat << EOF > ./src/app.module.ts
import { Module } from '@nestjs/common'

@Module({})
export class AppModule {}
EOF

#
cat << EOF > ./src/main.ts
import { NestFactory } from '@nestjs/core'
import { NestExpressApplication } from '@nestjs/platform-express'
import { AppModule } from './app.module'

async function bootstrap() {
  const app = await NestFactory.create<NestExpressApplication>(AppModule)

  await app.listen(3000)
}

bootstrap()
EOF
-->
