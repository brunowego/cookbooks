# GitHub Authentication Provider

## Links

- [Docs](https://backstage.io/docs/auth/github/provider)

<!-- ## Installation

```sh
pnpm add @backstage/plugin-catalog-backend-module-github -D
```

## Configuration

**Refer:** `./packages/backend/src/plugins/catalog.ts`

```ts
// ...
import { GithubOrgEntityProvider } from '@backstage/plugin-catalog-backend-module-github'

export default async function createPlugin(
  env: PluginEnvironment
): Promise<Router> {
  // ...

  builder.addEntityProvider(
    GithubOrgEntityProvider.fromConfig(env.config, {
      id: 'production',
      orgUrl: 'https://github.com/<owner>',
      logger: env.logger,
      schedule: env.scheduler.createScheduledTaskRunner({
        frequency: { minutes: 60 },
        timeout: { minutes: 15 },
      }),
    })
  )

  // ...
}
``` -->
