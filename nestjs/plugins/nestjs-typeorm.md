# NestJS TypeORM

## Links

- [Code Repository](https://github.com/nestjs/typeorm)

## Installation

```sh
# Using Yarn
yarn add @nestjs/typeorm typeorm pg
yarn add ts-node --dev
```

## Bootstrap

```sh
#
npx nest generate module database
npx nest generate module user
```

## Configuration

**Refer:** `./`

```ts
import { Module } from '@nestjs/common'
import { TypeOrmModule } from '@nestjs/typeorm'
// ...

@Module({
  imports: [TypeOrmModule.forFeature([/* ... */])],
  // ...
})
export class UserModule {}
```

**Refer:** `./ormconfig.ts`

```ts
```

**Refer:** `./package.json`

```json
{
  "scripts": {
    // ...
    "migration:generate": "npm run build && npm run typeorm -- migration:generate -n",
    "migration:up": "npm run build && npm run typeorm -- migration:run",
    "migration:down": "npm run build && npm run typeorm -- migration:revert"
  }
}
```
