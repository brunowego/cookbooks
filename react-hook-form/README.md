# React Hook Form

<!--
https://github.com/pedroapfilho/acme-monorepo/tree/main/apps/web/src/app/(auth)/reset-password

https://github.com/documenso/documenso/blob/main/apps/web/src/components/forms/password.tsx
-->

## Links

- [Code Repository](https://github.com/react-hook-form/react-hook-form)
- [Main Website](https://react-hook-form.com)
- [Form Builder](https://react-hook-form.com/form-builder)
- [Docs](https://react-hook-form.com/docs)
  [useForm](https://react-hook-form.com/docs/useform) (shadcn/ui)

<!--
useController
useFormContext
useWatch
useFormState
useFieldArray
-->

## Learning

- [React Hook Form - Complete Tutorial (with Zod)](https://youtube.com/watch?v=cc_xmawJ8Kg)

## Library

### Installation

```sh
# Using pnpm
pnpm add react-hook-form
```

<!-- ### Tips -->

<!-- #### TBD

```ts
const sleep = (ms: number) => new Promise((resolve) => setTimeout(resolve, ms))

await sleep(2000)
``` -->

### Issues

#### TBD

```log
A component is changing an uncontrolled input to be controlled. This is likely caused by the value changing from undefined to a defined value, which should not happen. Decide between using a controlled or uncontrolled input element for the lifetime of the component. More info: https://react.dev/link/controlled-components
```

<!-- Missing defaultValues -->

TODO

#### TBD

```log
Cannot update a component (`Controller`) while rendering a different component (`Controller`). To locate the bad setState() call inside `Controller`, follow the stack trace as described in https://react.dev/link/setstate-in-render
```

<!--
https://github.com/facebook/react/issues/18178#issuecomment-595846312
-->

TODO

#### TBD

```log
Type '{ onChange: (...event: any[]) => void; onBlur: Noop; value: string | null | undefined; disabled?: boolean | undefined; name: "lastName"; ref: RefCallBack; type: "text"; }' is not assignable to type 'InputHTMLAttributes<HTMLInputElement>'.
  Types of property 'value' are incompatible.
    Type 'string | null | undefined' is not assignable to type 'string | number | readonly string[] | undefined'.
      Type 'null' is not assignable to type 'string | number | readonly string[] | undefined'.ts(2322)
```

```tsx
<Form.Field
  control={control}
  name="lastName"
  render={({ field: { value, ...field } }) => (
    <Form.Item>
      <Form.Label>Last name</Form.Label>

      <Form.Control>
        <Input type="text" value={value ?? ''} {...field} />
      </Form.Control>

      <Form.Message />
    </Form.Item>
  )}
/>
```

<!--
or change from selectUserSchema to insertUserSchema
-->
