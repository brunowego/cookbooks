# Extend with Schedule

<!--
https://github.com/47ng/fastify-cron
-->

## Links

- [Code Repository](https://github.com/fastify/fastify-schedule)

## Snippet

```ts
import { AsyncTask, CronJob } from 'toad-scheduler'

import db from '@acme/db'

const task = new AsyncTask(
  'process file import',
  async () => {
    const result = await db('file_imports')
      .where('processing_status', 'pending')
      .orderBy('created_at', 'asc')
      .limit(1)

    if (result.length === 0) {
      return
    }

    const fileImport = result[0]

    await db('file_imports').where('id', fileImport.id).update({
      processed_rows: 0,
      processing_status: 'processing',
      processing_started_at: new Date(),
    })

    // TODO: process the file
  },
  (err) => {
    console.error(err)
  }
)

const processFileImportJob = new CronJob(
  { cronExpression: '*/5 * * * *' },
  task,
  {
    preventOverrun: true,
  }
)

export default processFileImportJob
```

```ts
import { AsyncTask, SimpleIntervalJob } from 'toad-scheduler'

import db from '@acme/db'

const task = new AsyncTask(
  'simple task',
  async () => {
    const result = await db('file_imports').where(
      'processing_status',
      'pending'
    )

    await db('file_imports').where('id', result[0].id).update({
      processed_rows: 0,
      processing_status: 'processing',
      processing_started_at: new Date(),
    })
  },
  (err) => {
    console.error(err)
  }
)

const processFileImportJob = new SimpleIntervalJob({ minutes: 1 }, task)

export default processFileImportJob
```

```ts
import fp from 'fastify-plugin'
import fastifySchedule from '@fastify/schedule'

import processFileImportJob from '../jobs/process-file-imports'

export default fp(
  async (fastify) => {
    await fastify
      .register(fastifySchedule)
      .ready()
      .then(() => {
        fastify.scheduler.addCronJob(processFileImportJob)
        // fastify.scheduler.addIntervalJob(processFileImportJob)
      })
  },
  { name: 'scheduler' }
)
```
