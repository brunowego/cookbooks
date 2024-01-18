# Jest

**Keywords:** Assertion Library, Unit Testing

## Links

- [Code Repository](https://github.com/facebook/jest)
- [Main Website](https://jestjs.io)
- Docs
  - [Configuring Jest](https://jestjs.io/docs/configuration)

## CLI

### Commands

```sh
npx jest -h
```

### Initialize

```sh
npx jest --init
```

## Library

### Installation

```sh
# Using Yarn
yarn add @types/jest jest ts-jest --dev
```

### Configuration

**Refer:** `./package.json`

```json
{
  "scripts": {
    // ...
    "test": "jest",
    "test:watch": "jest --watch",
    "test:cov": "jest --collect-coverage"
    // ...
  }
}
```

**Refer:** `./jest.config.ts`

```ts
import type { Config } from 'jest'

const config: Config = {
  verbose: true,
}

export default config
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension Orta.vscode-jest

#
jq '."recommendations" += ["Orta.vscode-jest"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

### Issues

#### TBD

```log
Jest worker encountered 4 child process exceptions, exceeding retry limit
```

TODO

#### Missing Module Mapper

```log
Cannot find module '@/app.controller' from 'app.controller.spec.ts'
```

**Refer:** `./tsconfig.json`

```json
{
  "compilerOptions": {
    // ...
    "resolveJsonModule": true
    // ...
  }
}
```

**Refer:** `./jest.config.ts`

```ts
import type { Config } from 'jest'
import { pathsToModuleNameMapper } from 'ts-jest'
import { compilerOptions } from './tsconfig.json'

const config: Config = {
  // ...
  moduleNameMapper: pathsToModuleNameMapper(compilerOptions.paths, {
    prefix: '<rootDir>/../../',
  }),
}

export default config
```

#### TBD

```log
SyntaxError: Cannot use import statement outside a module
```

TODO

<!--
# package.json

"build": "nest build",
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

"devDependencies": {
  "@nestjs/testing": "^10.0.0",
  "@types/jest": "^29.5.2",
  "@types/supertest": "^6.0.0",
  "supertest": "~6.3.4",
  "jest": "^29.5.0",
  "ts-jest": "^29.1.0",
}

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

# tsconfig.build.json

{
  "exclude": ["test", "**/*spec.ts"]
}

# test/jest-e2e.json

{
  "moduleFileExtensions": ["js", "json", "ts"],
  "rootDir": ".",
  "testEnvironment": "node",
  "testRegex": ".e2e-spec.ts$",
  "transform": {
    "^.+\\.(t|j)s$": "ts-jest"
  }
}

# test/app.e2e-spec.ts

import { Test, TestingModule } from '@nestjs/testing';
import { INestApplication } from '@nestjs/common';
import * as request from 'supertest';
import { AppModule } from './../src/app.module';

describe('AppController (e2e)', () => {
  let app: INestApplication;

  beforeEach(async () => {
    const moduleFixture: TestingModule = await Test.createTestingModule({
      imports: [AppModule],
    }).compile();

    app = moduleFixture.createNestApplication();
    await app.init();
  });

  it('/ (GET)', () => {
    return request(app.getHttpServer())
      .get('/')
      .expect(200)
      .expect('Hello World!');
  });
});

# src/app.controller.spec.ts

import { Test, TestingModule } from '@nestjs/testing';
import { AppController } from './app.controller';
import { AppService } from './app.service';

describe('AppController', () => {
  let appController: AppController;

  beforeEach(async () => {
    const app: TestingModule = await Test.createTestingModule({
      controllers: [AppController],
      providers: [AppService],
    }).compile();

    appController = app.get<AppController>(AppController);
  });

  describe('root', () => {
    it('should return "Hello World!"', () => {
      expect(appController.getHello()).toBe('Hello World!');
    });
  });
});
-->
