# Zod

## Links

- [Code Repository](https://github.com/CarterGrimmeisen/zod-prisma)

## Related

- [Zod](/zod.md)

## Installation

```sh
# Using Yarn
yarn add zod-prisma --dev
```

## Configuration

**Refer:** `./db/prisma/schema.prisma`

```prisma
// ...
generator zod {
  provider      = "zod-prisma"
  output        = "../../src/schemas"
  relationModel = true
  modelCase     = "camelCase"
  modelSuffix   = "Schema"
}

// ...
```

```sh
#
cat << EOF >> ./.gitignore
/src/schemas/*.ts
!/src/schemas/.gitkeep
EOF

#
npx prisma generate
```

<!--
/// @zod.nonempty()
/// @zod.custom(imports.eventTypeSlug)
/// @zod.email()
/// @zod.custom(imports.eventTypeLocations)
-->

<!-- **Refer:** `./db/prisma/zod-utils.ts`

```ts
import { z } from "zod";

import { LocationType } from "@calcom/lib/location";
import { slugify } from "@calcom/lib/slugify";

export const eventTypeLocations = z.array(
  z.object({ type: z.nativeEnum(LocationType), address: z.string().optional() })
);

export const eventTypeSlug = z.string().transform((val) => slugify(val.trim()));
export const stringToDate = z.string().transform((a) => new Date(a));
export const stringOrNumber = z.union([z.string().transform((v) => parseInt(v, 10)), z.number().int()]);
``` -->
