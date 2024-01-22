# Extend with TypeOrm

<!--
https://github.com/ToolJet/ToolJet/blob/develop/server/ormconfig.ts
-->

TODO

<!--
# src/modules/health/health.controller.ts
import { Controller, Get } from '@nestjs/common'
import {
  // TypeOrmHealthIndicator,
  HealthCheckService,
  HttpHealthIndicator,
  HealthCheck,
} from '@nestjs/terminus'
// import { HealthcheckService } from './health.service'

@Controller('_healthcheck')
export class HealthcheckController {
  constructor(
    // private db: TypeOrmHealthIndicator,
    private health: HealthCheckService,
    private http: HttpHealthIndicator // private readonly healthcheckService: HealthcheckService
  ) {}

  @Get()
  @HealthCheck()
  check() {
    return this.health.check([
      // () => this.db.pingCheck('database'),
      () => this.http.pingCheck('app', 'https://google.com'),
    ])
  }
  // getHello(): string {
  //   return this.healthcheckService.getHello();
  // }
}
-->
