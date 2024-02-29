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

#### Tailwind Error

```log
Error: Tailwind: To use responsive styles you must have a <head> element as a direct child of the Tailwind component.
```

```tsx
export const Email = () => {
  return (
    <Html>
      <Tailwind>
        <Head />

        <Preview />

        <Body />
      </Tailwind>
    </Html>
  )
}
```

#### TBD

```log
Warning: Each child in a list should have a unique "key" prop.%s See https://reactjs.org/link/warning-keys for more information.
```

<!--
https://github.com/resend/react-email/issues/1111
https://github.com/vercel/next.js/issues/55642
-->

TODO
