# Extend with Quirrel

<!--
https://github.com/search?q=path%3Apackage.json+content%3Aquirrel+content%3A%22next+dev%22&type=code
-->

<!--
Examples

https://github.com/metagame-xyz/heartbeat-service/blob/main/pages/api/v1/queues/updateMetadata.ts
https://github.com/chaonengs/aifactory/blob/master/src/pages/api/queues/messages.ts
https://github.com/peterferguson/socii/blob/master/app/pages/api/queues/funding.ts
https://github.com/metagame-xyz/core/blob/main/pages/api/queues/openseaForceUpdate.ts
https://github.com/davialcantaraa/tranquilmind/blob/main/src/pages/api/queues/confirm-id.ts
https://github.com/quirrel-dev/water-reminder-demo/blob/main/pages/api/queues/reminder.js
https://github.com/boutmo/cineMatch/blob/main/src/pages/api/queues/webhook.ts
https://github.com/vanxh/ezposter/blob/main/src/pages/api/autopost.ts
https://github.com/geoffoliver/podmix/blob/master/pages/api/playlists/update-search-index.ts
-->

## Installation

```sh
# Using pnpm
pnpm add concurrently -D
pnpm add concurrently quirrel
```

## Configuration

```json
{
  "scripts": {
    // ...
    "dev": "concurrently 'next dev' 'quirrel'"
  }
}
```

```sh
# Open Quirrel UI
echo -e '[INFO]\thttp://localhost:9181'
# Or
echo -e '[INFO]\thttps://ui.quirrel.dev'

#
mkdir ./src/app/api/queues
```

<!-- /<name>/route.ts -->

<!--
./src/app/api/queues/stores/route.ts

import { Queue } from 'quirrel/next-app'

export interface StoreData {
  id: string
  name: string
}

export const storesQueue = Queue('api/queues/stores', async (job: StoreData) => {
  const { id, name } = job

  // eslint-disable-next-line no-console -- demo
  console.log('Get id:', id, ', and name:', name)

  await Promise.resolve()
})

export const POST = storesQueue
-->

<!--
./src/app/api/queue/start/route.ts

import { NextResponse } from 'next/server'

import { storesQueue, type StoreData } from '../../queues/stores/route'

export async function POST(req: Request): Promise<NextResponse> {
  const storeData: StoreData = await req.json()

  try {
    await storesQueue.enqueue(storeData, {
      id: storeData.id,
      delay: '10s',
      exclusive: true,
    })

    return NextResponse.json({
      status: 'enqueued',
      message: 'TBD',
    })
  } catch (error) {
    return NextResponse.json({
      status: 500,
      body: { message: 'TBD', error },
    })
  }
}
-->

<!--
./src/app/api/queue/end/route.ts

import { NextResponse } from 'next/server'

import { storesQueue, type StoreData } from '../../queues/stores/route'

export async function POST(req: Request): Promise<NextResponse> {
  const storeData: StoreData = await req.json()

  try {
    await storesQueue.delete(storeData.id)

    return NextResponse.json({
      message: `UserID ${storeData.id} set up in the queue.`,
    })
  } catch (error) {
    return NextResponse.json({
      status: 500,
      body: { message: 'TBD', error },
    })
  }
}
-->
