# React Hook Form DevTools

## Links

- [Code Repository](https://github.com/react-hook-form/devtools)

## Instalation

```sh
# Using pnpm
pnpm add @hookform/devtools -D

# Using Bun
bun add @hookform/devtools -D
```

## Usage

```tsx
import type { DevtoolUIProps } from '@hookform/devtools/dist/devToolUI'
import dynamic from 'next/dynamic'

const DevTool = dynamic<DevtoolUIProps>(
  () => import('@hookform/devtools').then((mod) => mod.DevTool),
  {
    ssr: false,
  }
)

export default () => {
  return (
    <>
      <DevTool control={control} placement="top-left" />

      <Form />
    </>
  )
}
```

## Issues

### TBD

```log
Warning: Text content did not match. Server: "[+] EXPAND" Client: "[-] COLLAPSE"
```

TODO

### TBD

```log
Warning: An error occurred during hydration. The server HTML was replaced with client content in <#document>.
```

<!--
https://nextjs.org/docs/messages/react-hydration-error

suppressHydrationWarning
-->

TODO

<!--
Uncaught Error: Text content does not match server-rendered HTML.
Uncaught Error: There was an error while hydrating. Because the error happened outside of a Suspense boundary, the entire root will switch to client rendering.
-->

<!--
import type { DevtoolUIProps } from '@hookform/devtools/dist/devToolUI'
import dynamic from 'next/dynamic'

const DevTool = dynamic<DevtoolUIProps>(
  () => import('@hookform/devtools').then((mod) => mod.DevTool),
  {
    ssr: false,
  },
)

export type FormProps<TFieldValues extends FieldValues = FieldValues> =
  FormProviderProps<TFieldValues, unknown, TFieldValues | undefined>

const Form = <TFieldValues extends FieldValues = FieldValues>({
  children,
  ...props
}: FormProps<TFieldValues>) => {
  return (
    <FormProvider {...props}>
      {children}

      <DevTool control={control} placement='top-left' />
    </FormProvider>
  )
}

Form.displayName = 'Form'
-->
