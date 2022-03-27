# Health

## Installation

```sh
# Using Yarn
yarn add @nestjs/axios @nestjs/terminus
```

## Bootstrap

```sh
#
npx nest generate module health
```

## Configuration

**Refer:** `./src/health/health.controller.ts`

```ts
import { Controller, Get } from '@nestjs/common'
import {
  // TypeOrmHealthIndicator,
  HealthCheckService,
  HttpHealthIndicator,
  HealthCheck,
} from '@nestjs/terminus'

@Controller('health-check')
export class HealthController {
  constructor(
    // private db: TypeOrmHealthIndicator,
    private health: HealthCheckService,
    private http: HttpHealthIndicator
  ) {}

  @Get()
  @HealthCheck()
  check() {
    return this.health.check([
      // () => this.db.pingCheck('database'),
      () => this.http.pingCheck('app', 'https://google.com'),
    ])
  }
}
```

**Refer:** `./src/health/health.module.ts`

```ts
import { Module } from '@nestjs/common'
import { HttpModule } from '@nestjs/axios'
import { TerminusModule } from '@nestjs/terminus'
import { HealthController } from './health.controller'

@Module({
  imports: [HttpModule, TerminusModule],
  controllers: [HealthController],
})
export class HealthModule {}
```
