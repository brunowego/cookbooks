# Extend with Validation

## Installation

```sh
# Using Yarn
yarn add class-validator class-transformer
```

## Configuration

**Refer:** `./src/main.ts`

```ts
// ...

async function bootstrap() {
  const app = await NestFactory.create<NestExpressApplication>(AppModule)

  app.useGlobalPipes(
    new ValidationPipe({
      forbidNonWhitelisted: true,
      transform: true,
      whitelist: true,
    })
  )

  // ...
}

// ...
```

<!--
@IsString({ each: true })
-->
