# Extend with typesafe-i18n

## Installation

```sh
# Using pnpm
pnpm add typesafe-i18n
pnpm add concurrently -D
```

## Configuration

**Refer:** `./.typesafe-i18n.json`

```json
{
  "adapter": "react",
  "$schema": "https://unpkg.com/typesafe-i18n@5.24.3/schema/typesafe-i18n.json"
}
```

**Refer:** `./`

```json
{
  "scripts": {
    "dev": "concurrently 'next dev' 'typesafe-i18n'"
    // ...
  }
}
```

**Refer:** `./next.config.mjs`

```mjs
/**
 * @type { import('next').NextConfig }
 */
const nextConfig = {
  // ...
  i18n: {
    locales: ['en', 'pt-BR'],
    defaultLocale: 'en',
  },
}

export default nextConfig
```

```sh
pnpm dev
```
