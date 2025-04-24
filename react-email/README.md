# React Email

## Links

- [Code Repository](https://github.com/resendlabs/react-email)
- [Main Website](https://react.email)
- [Examples](https://react.email/examples)
  - [Code Repository](https://github.com/resend/react-email/tree/canary/apps/demo/emails)

## Library

### Installation

```sh
# Using Bun
bun add @react-email/components react-email
```

### Issues

#### TBD

```log
Error: Cannot find module 'next/dist/server/app-render/after-task-async-storage.external.js'
```

TODO

#### TBD

```log
Error: Unable to install the dependencies and it exited with code: 1
```

<!--
https://github.com/resend/react-email/issues/1432
-->

TODO

#### TBD

```log
Error: The file "/vercel/path0/packages/email/.react-email/.next/routes-manifest.json" couldn't be found. This is often caused by a misconfiguration in your project.
```

TODO

#### Tailwind Error

```log
Error: Tailwind: To use responsive styles you must have a <head> element as a direct child of the Tailwind component.
```

```tsx
import { Html, Head, Preview, Body } from '@react-email/components'
import { Tailwind } from '@react-email/tailwind'
import { Fragment } from 'react'

export const Email = () => {
  return (
    <Html>
      <Tailwind>
        <Fragment>
          <Head />

          <Preview />

          <Body />
        </Fragment>
      </Tailwind>
    </Html>
  )
}
```

#### TBD

```log
@acme/email:build: Error: Unable to install the dependencies and it exited with code: 1
@acme/email:build:     at ChildProcess.<anonymous> (/vercel/path0/node_modules/.pnpm/react-email@3.0.7_@opentelemetry+api@1.9.0_@playwright+test@1.47.2_react-dom@18.3.1_react@18.3.1__react@18.3.1/node_modules/react-email/dist/cli/index.js:2116:36)
@acme/email:build:     at ChildProcess.emit (node:events:518:28)
@acme/email:build:     at maybeClose (node:internal/child_process:1101:16)
@acme/email:build:     at ChildProcess._handle.onexit (node:internal/child_process:304:5)
@acme/email:build:  ELIFECYCLE  Command failed with exit code 1.
@acme/email:build: ERROR: command finished with error: command (/vercel/path0/packages/email) /pnpm9/node_modules/.bin/pnpm run build exited (1)
@acme/email#build: command (/vercel/path0/packages/email) /pnpm9/node_modules/.bin/pnpm run build exited (1)
```

<!--
https://github.com/resend/react-email/issues/1432
-->

TODO

#### TBD

```log
Warning: Each child in a list should have a unique "key" prop.%s See https://reactjs.org/link/warning-keys for more information.
```

<!--
https://github.com/resend/react-email/issues/1111
https://github.com/vercel/next.js/issues/55642
-->

TODO

#### SSR Problem with @react-email/tailwind

```log
Error: Attempted to call the default export of [...] from the server but it's on the client. It's not possible to invoke a client function from the server, it can only be rendered as a Component or passed to props of a Client Component.
```

<!--
https://github.com/resend/react-email/discussions/1816
https://github.com/resend/react-email/issues/977

https://stackoverflow.com/questions/77190078/attempted-to-call-the-default-export-of-from-the-server-but-its-on-the-client
-->

TODO

#### TBD

```log
Error: Failed to render React component. Make sure to install `@react-email/render`
```

<!--
https://github.com/resend/react-email/issues/1041
-->

TODO

#### TBD

```log
Internal error: Error: Objects are not valid as a React child (found: object with keys {$$typeof, type, key, props, _owner, _store}). If you meant to render a collection of children, use an array instead.
```

<!--
https://github.com/TypeCellOS/BlockNote/issues/1347
https://github.com/resend/react-email/discussions/1240
https://github.com/resend/react-email/issues/1803
-->

TODO
