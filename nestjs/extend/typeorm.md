# Extend with TypeOrm

<!--
https://github.com/fedeya/cocos-challenge/tree/main/packages/db/src
https://github.com/Number16BusShelter/ZERP-template/tree/master/packages/db/src
https://github.com/lance13c/kinetic-xyz/tree/main/packages/db/src
https://github.com/DoomsdayDevice/bits/tree/master/packages/db/src
https://github.com/ayushpatel-05/KAM-Lead-Management-System/tree/main/packages/db/src
https://github.com/KHYehor/ImpulseTestTask/tree/production/packages/db
https://github.com/ConsiderItDone/omni-monorepo/tree/master/packages/db/src
https://github.com/jedwards1230/myChat/tree/main/packages/db/src
https://github.com/Economica-Bot/economica/blob/Production/packages/db
https://github.com/jellydn/learn-tdd-with-katas/tree/main/packages/db/src
-->

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
