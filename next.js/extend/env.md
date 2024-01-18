# Extend with ENV

## Installation

```sh
# Using pnpm
pnpm add zod
```

## Configuration

**Refer:** `./src/env.ts`

```ts
import { z } from 'zod'

export type PublicEnv = z.infer<typeof publicEnvSchema>

const publicEnvSchema = z.object({
  NEXT_PUBLIC_BASE_URL: z.string().url().min(1),
})

export const publicEnv = publicEnvSchema.parse({
  NEXT_PUBLIC_BASE_URL: process.env.NEXT_PUBLIC_BASE_URL,
} satisfies Record<keyof PublicEnv, string | undefined>)

export type ServerEnv = z.infer<typeof serverEnvSchema>

export const serverEnvSchema = z.object({
  NODE_ENV: z.enum(['development', 'test', 'production']).optional(),
  DATABASE_URL: z.string().url().min(1),
})

export const serverEnv = serverEnvSchema.parse({
  NODE_ENV: process.env.NODE_ENV,
  DATABASE_URL: process.env.DATABASE_URL,
} satisfies Record<keyof ServerEnv, string | undefined>)
```

**Refer:** `./turbo.json`

```json
{
  "$schema": "https://turbo.build/schema.json",
  "extends": ["//"],
  "pipeline": {
    "db:generate": {
      "outputs": ["src/db/migrations/**"]
    },
    "db:migrate": {
      "cache": false
    },
    "db:seed": {
      "cache": false
    },
    "db:studio": {
      "cache": false
    },
    "build": {
      "outputs": [".next/**", "!.next/cache/**"],
      "env": ["NODE_ENV", "DATABASE_URL", "NEXT_PUBLIC_BASE_URL"]
    }
  }
}
```

**Refer:** `./.env`

```env
DATABASE_URL=postgresql://acme:acme@localhost:5432/acme

NEXT_PUBLIC_BASE_URL=http://localhost:3000
```
