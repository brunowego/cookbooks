# headless-currency-input

## Links

- [Code Repository](https://github.com/danestves/headless-currency-input)

## Snippet

**Refer:** `./currency-input.tsx`

```tsx
import { type CurrencyInputProps, CurrencyInput } from 'headless-currency-input'

import { inputVariants } from './input'
import cn from '../utils/cn'

export default function _CurrencyInput({
  className,
  ...props
}: CurrencyInputProps): JSX.Element {
  return (
    <CurrencyInput
      className={cn('text-right', inputVariants({ className }))}
      currency="BRL"
      locale="pt-BR"
      // withCurrencySymbol={false}
      {...props}
    />
  )
}
```

```tsx
<CurrencyInput
  onValueChange={(values) => {
    onChange(values.floatValue)
  }}
  placeholder="R$ 0,00"
  value={value}
/>
```
