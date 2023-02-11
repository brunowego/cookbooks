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

#### Missing Module Mapper

```log
Cannot find module '@/app.controller' from 'app.controller.spec.ts'
```

**Refer:** `./tsconfig.json`

```json
{
  "compilerOptions": {
    // ...
    "resolveJsonModule": true,
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
