# NestJS Config

## Links

- [Code Repository](https://github.com/nestjs/config)

## Installation

```sh
# Using Yarn
yarn add @nestjs/config joi
```

## Bootstrap

```sh
#
npx nest generate module config
```

## Configuration

**Refer:** `./src/config/app.config.ts`

```ts
import { registerAs } from '@nestjs/config'

export default registerAs('app', () => ({
  timezone: process.env.TZ,
  environment: process.env.NODE_ENV,
  secretKey: process.env.SECRET_KEY,
  port: parseInt(process.env.PORT, 10) || 3000,
  url: process.env.PUBLIC_URL || 'http://localhost:3000',
}))
```

**Refer:** `./src/config/config.module.ts`

```ts
import Joi from 'joi'
import { Module } from '@nestjs/common'
import { ConfigModule as NestConfigModule } from '@nestjs/config'
import appConfig from './app.config'

const validationSchema = Joi.object({
  // App
  TZ: Joi.string().default('UTC'),
  PORT: Joi.number().default(3000),
  SECRET_KEY: Joi.string().required(),
  NODE_ENV: Joi.string().valid('development', 'production').default('development'),

  // URLs
  PUBLIC_URL: Joi.string().default('http://localhost:3000'),
})

@Module({
  imports: [
    NestConfigModule.forRoot({
      load: [appConfig],
      validationSchema: validationSchema,
    }),
  ],
})
export class ConfigModule {}
```

**Refer:** `./src/main.ts`

```ts
import { NestFactory } from '@nestjs/core'
import { NestExpressApplication } from '@nestjs/platform-express'
import { AppModule } from './app.module'
import { ConfigService } from '@nestjs/config'

async function bootstrap() {
  const app = await NestFactory.create<NestExpressApplication>(AppModule)

  const configService = app.get(ConfigService)
  const port = configService.get<number>('app.port')

  await app.listen(port)
}

bootstrap()
```

```sh
#
cat << EOF >> ./.env
TZ=UTC
SECRET_KEY='S3cr3t_K#Key'

PUBLIC_URL=http://localhost:3000
EOF
```
