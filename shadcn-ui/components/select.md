# Select

## Snippets

```tsx
import Select from '@acme/ui/components/select'
;<Select defaultValue={value} onValueChange={(v) => onChange(v)}>
  <Select.Trigger>
    <Select.Value />
  </Select.Trigger>

  <Select.Content>
    {list.map((value, label) => (
      <Select.Item key={value} value={value}>
        {label}
      </Select.Item>
    ))}
  </Select.Content>
</Select>
```

## Issues

### TBD

```log
Warning: You provided a `value` prop to a form field without an `onChange` handler. This will render a read-only field. If the field should be mutable use `defaultValue`. Otherwise, set either `onChange` or `readOnly`.
```

<!--
https://github.com/shadcn-ui/ui/issues/3427
-->

TODO
