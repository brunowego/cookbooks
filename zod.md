# Zod

<!--
https://github.com/chrsep/atreus/blob/main/dashboard/src/pages/api/companies/index.ts

tRPC
-->

<!--
Alternative

https://github.com/jquense/yup
https://github.com/hapijs/joi
-->

## Links

- [Code Repository](https://github.com/colinhacks/zod)

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
