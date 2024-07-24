# react-number-format

## Links

- [Code Repository](https://github.com/s-yadav/react-number-format)

## Snippet

```ts
import { forwardRef, type ElementRef } from 'react'
import { type NumericFormatProps, NumericFormat } from 'react-number-format'

import { inputVariants } from './input'
import cn from '../utils/cn'

type CurrencyInputProps = NumericFormatProps & {
  className?: string
}

const CurrencyInput = forwardRef<
  ElementRef<typeof NumericFormat>,
  CurrencyInputProps
>(({ className, ...props }, ref) => {
  return (
    <div className="relative">
      <span className="absolute inset-y-1 left-4 flex select-none items-center text-muted-foreground">
        R$
      </span>

      <NumericFormat
        allowNegative={false}
        className={inputVariants({
          className: cn('pl-10 text-right', className),
        })}
        // customInput={Input}
        decimalScale={2}
        // decimalSeparator=','
        displayType="input"
        fixedDecimalScale={true}
        getInputRef={ref}
        placeholder="0.00"
        // thousandSeparator='.'
        // max={10000}
        {...props}
      />
    </div>
  )
})
CurrencyInput.displayName = 'CurrencyInput'

export { CurrencyInput as default }
```

```ts
<CurrencyInput {...field} />
```
