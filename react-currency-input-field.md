# react-currency-input-field

## Snippet

**Refer:** `./currency-input.tsx`

```tsx
import CurrencyInputField, {
  type CurrencyInputProps as CurrencyInputFieldProps,
} from 'react-currency-input-field'

import { inputVariants } from './input'
import cn from '../utils/cn'

type CurrencyInputProps = CurrencyInputFieldProps & {
  onChange: (value: number | null | undefined) => void
}

export default function CurrencyInput({
  className,
  onChange,
  ...props
}: CurrencyInputProps): JSX.Element {
  return (
    <CurrencyInputField
      // allowDecimals={true}
      allowNegativeValue={false}
      className={cn('text-right', inputVariants({ className }))}
      decimalsLimit={2}
      // fixedDecimalLength={2}
      intlConfig={{ locale: 'pt-BR', currency: 'BRL' }}
      onValueChange={(_, _name, values) => onChange(values?.float)}
      step={1}
      {...props}
    />
  )
}
```

```tsx
<CurrencyInput onChange={onChange} placeholder="R$ 0" value={value} />
```
