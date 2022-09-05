# Next.js

## Configuration

**Refer:** `./turbo.json`

```json
{
  "$schema": "https://turborepo.org/schema.json",
  // "globalDependencies": ["./apps/site/.env"],
  "pipeline": {
    // ...
    "build": {
      // ...
      "outputs": ["./.next/**"]
    }
  }
}
```

<!--
{
  "$schema": "https://turborepo.org/schema.json",
  "baseBranch": "origin/main",
  "pipeline": {
    "@my-project/site#build": {
      "dependsOn": [
        "^build",
        "$NEXT_PUBLIC_SITE_URL",
        "$NEXT_PUBLIC_ASSETS_URL",
        "$NEXT_PUBLIC_GA_MEASUREMENT_ID",
        "$SENTRY_DSN",
        "$SENTRY_AUTH_TOKEN"
      ],
      "outputs": ["./.next/**"]
    },
  }
}
-->
