# kubernetes

## Links

- Code Repository
  - [kubernetes](https://github.com/backstage/backstage/tree/master/plugins/kubernetes)
  - [kubernetes-backend](https://github.com/backstage/backstage/tree/master/plugins/kubernetes-backend)
- [Configuring Kubernetes integration](https://backstage.io/docs/features/kubernetes/configuration)

## Installation

```sh
#
yarn add --cwd packages/app @backstage/plugin-kubernetes

#
yarn add --cwd packages/backend @backstage/plugin-kubernetes-backend
```

## Configuration

**Refer:** `./packages/app/src/components/catalog/EntityPage.tsx`

```tsx
// ...
import { EntityKubernetesContent } from '@backstage/plugin-kubernetes'

const serviceEntityPage = (
  <EntityLayout>
    // ...

    <EntityLayout.Route path="/kubernetes" title="Kubernetes">
      <EntityKubernetesContent />
    </EntityLayout.Route>
  </EntityLayout>
)
```

**Refer:** `./packages/backend/src/plugins/kubernetes.ts`

```ts
import { PluginEnvironment } from '../types'
import { Router } from 'express'
import { CatalogClient } from '@backstage/catalog-client'
import { KubernetesBuilder } from '@backstage/plugin-kubernetes-backend'

export default async function createPlugin(env: PluginEnvironment): Promise<Router> {
  const catalogApi = new CatalogClient({ discoveryApi: env.discovery })

  const { router } = await KubernetesBuilder.createBuilder({
    logger: env.logger,
    config: env.config,
    catalogApi,
  }).build()

  return router
}
```

**Refer:** `./packages/backend/src/index.ts`

```ts
// ...
import kubernetes from './plugins/kubernetes'

async function main() {
  // ...
  const kubernetesEnv = useHotMemoize(module, () => createEnv('kubernetes'))

  // ...
  apiRouter.use('/kubernetes', await kubernetes(kubernetesEnv))
```

**Refer:** `./app-config.local.yaml`

```yml
# ...

kubernetes:
  serviceLocatorMethod:
    type: multiTenant
  clusterLocatorMethods:
    - type: config
      clusters:
        - url: https://kubernetes.default.svc.cluster.local
          name: internal
          authProvider: serviceAccount
          skipTLSVerify: true
          skipMetricsLookup: true
```

<!--
backstage.io/kubernetes-id: backstage
-->
