# Extend with Vercel

<!--
https://docs.cleavr.io/guides/nest/
-->

<!--
https://github.com/orgs/vercel/discussions?discussions_q=nestjs
-->

<!--
https://medium.com/nestjs-ninja/implementing-auth-flow-as-fast-as-possible-using-nestjs-bdf87488bc00
https://www.technog.com.br/blog/tips-and-tricks/how-to-deploy-a-nestjs-app-for-free-on-vercel/
https://www.danywalls.com/create-an-in-memory-crud-rest-api-using-nest-and-deploy-on-vercel
-->

<!--
ENABLE_EXPERIMENTAL_COREPACK=1
-->

<!-- ## Configuration

1. Project -> Settings
2. General
   - Build & Development Settings
     - Build Command:
       - Using pnpm: `cd ../../ && pnpm start --filter @acme/api`
     - Output Directory: `dist`
     - Install Command:
       - Using NPM: `npm install --prefix ../../`
       - Using Yarn: `yarn install --cwd ../../`
       - Using pnpm: `pnpm install --prefix ../../`
   - Root Directory: `apps/<name>`
3. Environment Variables -> Add New
   - Name: `ENABLE_ROOT_PATH_BUILD_CACHE`
   - Value: `1`
   - Add -->

## Configuration

**Refer:** `./vercel.json`

```json
{
  "builds": [
    {
      "src": "src/main.ts",
      "use": "@vercel/node"
    }
  ],
  "rewrites": [
    {
      "source": "/(.*)",
      "destination": "src/main.ts"
    }
  ]
}
```

## Issues

### TBD

```log
Command "turbo run build" exited with 1
```

TODO

### TBD

```log
This Serverless Function has crashed.
```

### TBD

```log
404: NOT_FOUND
Code: NOT_FOUND
```

TODO

### TBD

```log
The `vercel.json` schema validation failed with the following message: `builds[0]` should NOT have additional property `src:`
```

TODO

### TBD

```log
The "@nestjs/axios" package is missing. Please, make sure to install the library ($ npm install @nestjs/axios) to take advantage of HttpHealthIndicator.
```

TODO
