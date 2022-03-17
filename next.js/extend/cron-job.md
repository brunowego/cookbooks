# Cron Jobs

## Links

- [Vercel / Solutions / Cron Jobs](https://vercel.com/docs/concepts/solutions/cron-jobs)

## Workflow

### GitHub Actions

```yml
---
name: Cron - Downgrade Users

on:
  schedule:
    - cron: "0,15,30,45 * * * *" # https://crontab.guru/#0,15,30,45_*_*_*_*

jobs:
  cron:
    env:
      APP_URL: ${{ secrets.APP_URL }}
      API_SECRET_KEY: ${{ secrets.API_SECRET_KEY }}

    runs-on: ubuntu-latest

    steps:
      - name: cURL request
        if: ${{ env.APP_URL && env.API_SECRET_KEY }}
        run: |
          curl ${{ secrets.APP_URL }}/api/cron/downgrade-users \
            -X POST \
            -H 'content-type: application/json' \
            -H 'authorization: ${{ secrets.API_SECRET_KEY }}' \
            --fail
```

## Dependencies

```sh
# Using Yarn
yarn add dayjs
```

## Configuration

**Tip:** [Hash Generation](/hash.md#generate)

```sh
#
echo 'API_SECRET_KEY=' >> ./.env
```

**Refer:** `./src/types/env.d.ts`

```ts
declare namespace NodeJS {
  export interface ProcessEnv {
    readonly API_SECRET_KEY: string | undefined
  }
}
```

**Refer:** `./src/constants/index.ts`

```ts
export const TRIAL_LIMIT_DAYS = 14;
```

**Refer:** `./src/pages/api/cron/downgrade-users.js`

```ts
import type { NextApiRequest, NextApiResponse } from 'next'
import { StatusCodes, ReasonPhrases } from 'http-status-codes'
import prisma from '@/lib/prisma'
import dayjs from 'dayjs'
import { TRIAL_LIMIT_DAYS } from '@/constants'

export default async function handler(req: NextApiRequest, res: NextApiResponse) {
  const apiKey = req.headers.authorization || req.query.apiKey

  if (process.env.API_SECRET_KEY !== apiKey) {
    res.status(StatusCodes.UNAUTHORIZED).json({ message: ReasonPhrases.UNAUTHORIZED })

    return
  }

  if (req.method !== 'POST') {
    res.status(StatusCodes.METHOD_NOT_ALLOWED).json({ message: ReasonPhrases.METHOD_NOT_ALLOWED })

    return
  }

  await prisma.user.updateMany({
    data: {
      plan: 'FREE',
    },
    where: {
      plan: 'TRIAL',
      OR: [
        /**
         * If the user doesn't have a trial end date,
         * use the default 14 day trial from creation.
         */
        {
          createdDate: {
            lt: dayjs().subtract(TRIAL_LIMIT_DAYS, 'day').toDate(),
          },
          trialEndsAt: null,
        },
        /** If it does, then honor the trial end date. */
        {
          trialEndsAt: {
            lt: dayjs().toDate(),
          },
        },
      ],
    },
  })

  res.status(StatusCodes.OK).json({ message: ReasonPhrases.OK })
}
```
