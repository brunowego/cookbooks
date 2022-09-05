# Create Nest App

<!--
https://github.com/royib/clean-architecture-nestJS
-->

## References

- [Configuration Defaults](https://github.com/nestjs/nest-cli/blob/master/lib/configuration/defaults.ts)

## CLI

### Dependencies

- [Yarn](/yarn/yarn-migration.md#migrate)

### Scaffold

```sh
#
mkdir ./api && cd "$_"

#
git init

#
cat << EOF >> ./.gitignore
/dist
/node_modules
EOF

#
mkdir -p ./{src/{config,guards,modules,services,types,util},test}

#
yarn add @nestjs/common @nestjs/core @nestjs/platform-express reflect-metadata rxjs

#
yarn add @nestjs/cli @nestjs/schematics typescript --dev

#
cat << EOF > ./.nest-cli.json
{}
EOF

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

#
cat << EOF > ./tsconfig.json
{
  "\$schema": "https://json.schemastore.org/tsconfig",
  "compilerOptions": {
    "module": "commonjs",
    "declaration": true,
    "removeComments": true,
    "emitDecoratorMetadata": true,
    "experimentalDecorators": true,
    "allowSyntheticDefaultImports": true,
    "target": "es2017",
    "sourceMap": true,
    "outDir": "./dist",
    "incremental": true,
    "skipLibCheck": true,
    "strictNullChecks": false,
    "noImplicitAny": false,
    "strictBindCallApply": false,
    "forceConsistentCasingInFileNames": false,
    "noFallthroughCasesInSwitch": false,
    "baseUrl": "./",
    "paths": {
      "@/*": ["./src/*"]
    }
  }
}
EOF

#
cat << EOF > ./tsconfig.build.json
{
  "\$schema": "https://json.schemastore.org/tsconfig",
  "extends": "./tsconfig.json",
  "exclude": ["./dist", "./node_modules", "./test", "./**/*spec.ts"]
}
EOF
```

**Refer:** `./package.json`

```json
{
  // ...
  "scripts": {
    "clean": "yarn dlx rimraf ./dist",
    "dev": "nest start --watch",
    "build": "yarn run clean && nest build"
  }
  // ...
}
```

### Extend

- [Prettier](/prettier.md#library)

<!--
"scripts": {
  "format": "prettier --write \"src/**/*.ts\" \"test/**/*.ts\"",
  "start": "nest start",
  "start:dev": "nest start --watch",
  "start:debug": "nest start --debug --watch",
  "start:prod": "node dist/main",
  "lint": "eslint \"{src,apps,libs,test}/**/*.ts\" --fix",
  "test": "jest",
  "test:watch": "jest --watch",
  "test:cov": "jest --coverage",
  "test:debug": "node --inspect-brk -r tsconfig-paths/register -r ts-node/register node_modules/.bin/jest --runInBand",
  "test:e2e": "jest --config ./test/jest-e2e.json"
},
-->

<!--
"devDependencies": {
  "@nestjs/testing": "^8.0.0",
  "@types/express": "^4.17.13",
  "@types/jest": "27.4.1",
  "@types/node": "^16.0.0",
  "@types/supertest": "^2.0.11",
  "@typescript-eslint/eslint-plugin": "^5.0.0",
  "@typescript-eslint/parser": "^5.0.0",
  "eslint": "^8.0.1",
  "eslint-config-prettier": "^8.3.0",
  "eslint-plugin-prettier": "^4.0.0",
  "jest": "^27.2.5",
  "prettier": "^2.3.2",
  "source-map-support": "^0.5.20",
  "supertest": "^6.1.3",
  "ts-jest": "^27.0.3",
  "ts-loader": "^9.2.3",
  "ts-node": "^10.0.0",
  "tsconfig-paths": "^3.10.1",
  "typescript": "^4.3.5"
},
-->

<!--
"jest": {
  "moduleFileExtensions": [
    "js",
    "json",
    "ts"
  ],
  "rootDir": "src",
  "testRegex": ".*\\.spec\\.ts$",
  "transform": {
    "^.+\\.(t|j)s$": "ts-jest"
  },
  "collectCoverageFrom": [
    "**/*.(t|j)s"
  ],
  "coverageDirectory": "../coverage",
  "testEnvironment": "node"
}
-->
