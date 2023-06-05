# Extend with Fastify

## Links

- [Performance (Fastify)](https://docs.nestjs.com/techniques/performance)

## Installation

```sh
# Using pnpm
pnpm add @nestjs/platform-fastify @fastify/static
```

## Configuration

**Refer:** `./src/main.ts`

```ts
import {
  NestFastifyApplication,
  FastifyAdapter,
} from '@nestjs/platform-fastify'
// ...

async function bootstrap() {
  const app = await NestFactory.create<NestFastifyApplication>(
    AppModule,
    new FastifyAdapter()
  )

  // ...
}
```
