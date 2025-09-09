# Extend with PostHog

<!--
'use client'

import posthog from 'posthog-js'

import env from '@/lib/env/client'

const postHogClient = posthog.init(env.NEXT_PUBLIC_POSTHOG_KEY, {
  api_host: env.NEXT_PUBLIC_POSTHOG_HOST,
  defaults: '2025-05-24',
})

const captureEvent = (
  eventName: string,
  properties?: Record<string, unknown>,
) => posthog.capture(eventName, properties)

const resetUser = () => posthog.reset()

export { postHogClient, captureEvent, resetUser }
-->

<!--
Hook

https://github.com/santosmarco/github-jtgc5e-2/blob/develop/src/lib/analytics.ts | https://github.com/santosmarco/github-jtgc5e-2/blob/develop/src/hooks/useAnalytics.ts
-->

<!--
Organization

https://github.com/SteveLaiTVT/formbricks/blob/main/apps/web/app/(app)/environments/%5BenvironmentId%5D/components/PosthogIdentify.tsx
-->

## Issues

### TBD

```log
Cannot read properties of undefined (reading '__loaded')
```

<!--
https://github.com/PostHog/posthog-js/issues/1915
-->

TODO

### TBD

```log
@acme/app:dev:  ⨯ ReferenceError: self is not defined
```

<!--
https://github.com/stackseehq/analytics/issues/4

https://github.com/stackseehq/analytics/commit/c413e68bab713b2c981a07eeac5a231feb4d6274
-->

TODO

<!--
Hook

https://github.com/andrewm4894/andys-daily-riddle/blob/main/client/src/hooks/use-posthog.ts
https://github.com/MGeovany/fndrs-landing-v2/blob/main/hooks/use-posthog.ts
https://github.com/BrokenStryker/dark_s/blob/main/hooks/use-posthog.ts
https://github.com/9d8dev/wrk/blob/main/components/analytics/use-posthog-events.ts
https://github.com/hashicorp/dev-portal/blob/main/src/hooks/use-posthog-analytics.ts
https://github.com/minhtungo/multi-vendor-marketplace/blob/main/apps/storefront/src/lib/hooks/use-posthog.ts
https://github.com/onlydust-com/saas-frontend/blob/main/shared/tracking/posthog/use-posthog.ts
https://github.com/jonashoyer/edge-kit/blob/main/src/services/analytics/use-posthog-analytics.tsx
-->
