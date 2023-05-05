# NestJS Throttler

<!--
https://kongbytes.io/blog/nodejs-nestjs-security-check-list/
-->

## Links

- [Docs](https://docs.nestjs.com/security/rate-limiting)

## Installation

```sh
# Using pnpm
pnpm add @nestjs/throttler
```

**Refer:**

```ts
// ...
import { ThrottlerModule, ThrottlerGuard } from '@nestjs/throttler'
import { APP_GUARD } from '@nestjs/core'

@Module({
  imports: [
    // ...
    ThrottlerModule.forRoot({
      ttl: 60,
      limit: 100,
    }),
  ],
  providers: [
    // ...
    {
      provide: APP_GUARD,
      useClass: ThrottlerGuard,
    },
  ],
})
export class ApiModule {}
```
