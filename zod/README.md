# Zod

<!--
https://github.com/chrsep/atreus/blob/main/dashboard/src/pages/api/companies/index.ts
-->

<!--
Alternative

https://github.com/fabian-hiller/valibot
https://github.com/ianstormtaylor/superstruct
https://github.com/jquense/yup
https://github.com/hapijs/joi
-->

<!--
selectUserSchema
insertUserSchema
updateUserSchema | patchUserSchema
deleteUserSchema
-->

## Links

- [Code Repository](https://github.com/colinhacks/zod)

## Tools

- [transform / JSON to Zod Schema](https://transform.tools/json-to-zod)

## Library

### Installation

```sh
# Using pnpm
pnpm add zod
```

### Syntax

```ts
import { z } from 'zod'

export const ZUser = z.object({
  // ...
})

export type TUser = z.infer<typeof ZUser>
```

<!-- **Refer:** `./src/schemas/post.ts`

```ts
import { z } from 'zod'

export const postSchema = z.object({
  title: z.string(),
  body: z.string(),
})
``` -->

<!--
.regex(/^\d+$/)
-->

<!--
import { trimString } from '@/lib/utils'

z.preprocess(trimString, z.string())
-->

<!--
slug: z.string().transform((s) => slugify(s)),
-->

<!--
password: z.string().superRefine((data, ctx) => {
  const isStrict = false;
  const result = isPasswordValid(data, true, isStrict);
  Object.keys(result).map((key: string) => {
    if (!result[key as keyof typeof result]) {
      ctx.addIssue({
        code: z.ZodIssueCode.custom,
        path: [key],
        message: key,
      });
    }
  });
}),
-->

### Issues

#### TBD

```log
Type 'ZodString' is not assignable to type 'ZodType<unknown, unknown, $ZodTypeInternals<unknown, unknown>> | ((schema: ZodString) => ZodType<unknown, unknown, $ZodTypeInternals<unknown, unknown>>) | undefined'.
```

<!-- Type 'ZodString' is missing the following properties from type 'ZodType<unknown, unknown, $ZodTypeInternals<unknown, unknown>>': def, type, check, clone, and 6 more.ts(2322) -->

TODO

#### TBD

```log
Error: src/path/to/filename.tsx(57,17): error TS2589: Type instantiation is excessively deep and possibly infinite.
```

<!--
Try upgrade TypeScript, Zod, and @types/node version.
-->

TODO
