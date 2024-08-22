# Convex

<!--
Courses

https://www.youtube.com/watch?v=m_HRU6Qt1gI&t=2s
https://www.youtube.com/watch?v=vaQZYRSiimI
https://www.youtube.com/watch?v=0OaDyjB9Ib8&t=1s

https://stack.convex.dev/types-cookbook
https://jherr2020.medium.com/real-time-apis-done-right-with-rscs-4b474e253aad

https://airbyte.com/how-to-sync/convex-dev-to-local-csv
-->

**Keywords:** Backend as a Service

## Links

- [Main Website](https://convex.dev)
- [Dashboard](https://dashboard.convex.dev)
- [Templates](https://convex.dev/templates)
  - [Convex SaaS](https://github.com/get-convex/convex-saas)

## Terms

- React Server Components (RSC)

## CLI

### Installation

```sh
# Using pnpm
```

### Commands

```sh
# Using npx
npx convex -h
```

### Initialization

```sh
convex dev --typecheck disable --until-success
```

### Usage

```sh
#
convex dev

#
cat ~/.convex/config.json

#
convex dashboard
convex docs

#
convex import --table <name> ./<filename>.jsonl
convex import --table <name> ./<filename>.jsonl --replace

#
convex run <functionName> [args]

#
convex logs

#
convex deploy

#
convex logout
```

## Library

<!--
https://github.com/get-convex/convex-js
-->

### Installation

```sh
# Using pnpm
pnpm add convex
```

<!-- ### Configuration

```ts
import { cronJobs } from 'convex/server'
``` -->
